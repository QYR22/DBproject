<template>
    <div class="content-index">
        <article class="main-content page-page">
            <div class="post-header">
                <h1 class="post-title" itemprop="name headline"> {{ problem.title }} </h1>
                <div class="post-data">
                    <p v-if="problem.category != null" class="post-tags">
                        <a href="#">{{ problem.category.name }}</a>
                    </p>
                    <p class="post-tags">
                        <a href="#">题目类型 {{ typeChange[problem.type]}}</a>
                        <a href="#"><time>创建时间 {{ problem.createTime }}</time></a>
                        <a href="#">{{ difficultyLevels[problem.difficult] }}</a>
                        <a href="#">{{ finishedChange[problem.finished] }}</a>
                        <a href="#">{{ starsChange[problem.stars]}}</a>
                    </p>
                </div>
            </div>
            <div class="post-content" itemprop="problemBody">
                <p v-if="problem.tags != null && problem.tags.length>0" class="post-tags">
                    <a v-for="item in problem.tags" :key="item.id" href="#">{{ item.name }}</a>
                </p>
                <p v-if="problem.organizations != null" class="post-tags">
                    <a href="#">{{ problem.organizations.name }}</a>
                </p>
                <p v-if="problem.positions != null&& problem.positions.length>0" class="post-tags">
                    <a v-for="item in problem.positions" :key="item.id" href="#">{{ item.name }}</a>
                </p>
                <div id="post-content" ref="des" v-html="problem.des" />
                <div id="post-content" ref="code" v-html="problem.code" />
                <div id="post-content" ref="content" v-html="problem.content" />
            </div>
        </article>

        <div id="directory-content" class="directory-content initial headroom--not-bottom headroom--not-top pinned">
            <div id="directory" />
        </div>
        <el-backtop></el-backtop>
    </div>
</template>

<script>
import { getProblemById } from '@/api/problem'


export default {
    name: 'Index',
    data() {
        return {
            problem: {},
            data: {},
            list: [],
            form: {}
        }
    },
    created() {
        this.fetchData()
    },
    mounted() {
        setTimeout(() => {
            this.init()
        }, 400)
    },
    computed: {
        typeChange() {
            return {
                1: '文字题',
                2: '算法题',
                default: '/',
            };
        },
        difficultyLevels() {
            return {
                1: '简单',
                2: '中等',
                3: '困难',
                default: '/',
            };
        },
        finishedChange() {
            return {
                1: '已完成',
                2: '未完成',
                default: '/',
            };
        },
        starsChange() {
            return {
                0: 'null',
                1: '⭐',
                2: '⭐⭐',
                3: '⭐⭐⭐',
                4: '⭐⭐⭐⭐',
                5: '⭐⭐⭐⭐⭐',
                default: '/',
            };
        }
    },
    updated(){
        highlightCode()
    },
    methods: {
        fetchData() {
            getProblemById(this.$route.params.id).then(res => {
                this.problem = res.data
                console.log("problem",this.problem)
            })
        },
        init() {
            // 生成右侧目录导航
            var postDirectoryBuild = function() {
                var postChildren = function children(childNodes, reg) {
                    var result = []
                    var isReg = typeof reg === 'object'
                    var isStr = typeof reg === 'string'
                    var node; var i; var len
                    for (i = 0, len = childNodes.length; i < len; i++) {
                        node = childNodes[i]
                        if ((node.nodeType === 1 || node.nodeType === 9) &&
                            (!reg ||
                                isReg && reg.test(node.tagName.toLowerCase()) ||
                                isStr && node.tagName.toLowerCase() === reg)) {
                            result.push(node)
                        }
                    }
                    return result
                }
                var createPostDirectory = function(problem, directory, isDirNum) {
                    var contentArr = []
                    var titleId = []
                    var levelArr; var root; var level
                    var currentList; var list; var li; var link; var i; var len
                    levelArr = (function(problem, contentArr, titleId) {
                        var titleElem = postChildren(problem.childNodes, /^h\d$/)
                        var levelArr = []
                        var lastNum = 1
                        var lastRevNum = 1
                        var count = 0
                        var guid = 1
                        var id = 'directory' + (Math.random() + '').replace(/\D/, '')
                        var lastRevNum; var num; var elem
                        while (titleElem.length) {
                            elem = titleElem.shift()
                            contentArr.push(elem.innerHTML)
                            num = +elem.tagName.match(/\d/)[0]
                            if (num > lastNum) {
                                levelArr.push(1)
                                lastRevNum += 1
                            } else if (num === lastRevNum ||
                                num > lastRevNum && num <= lastNum) {
                                levelArr.push(0)
                                lastRevNum = lastRevNum
                            } else if (num < lastRevNum) {
                                levelArr.push(num - lastRevNum)
                                lastRevNum = num
                            }
                            count += levelArr[levelArr.length - 1]
                            lastNum = num
                            elem.id = elem.id || (id + guid++)
                            titleId.push(elem.id)
                        }
                        if (count !== 0 && levelArr[0] === 1) levelArr[0] = 0
                        return levelArr
                    })(problem, contentArr, titleId)
                    currentList = root = document.createElement('ul')
                    var dirNum = [0]
                    for (i = 0, len = levelArr.length; i < len; i++) {
                        level = levelArr[i]
                        if (level === 1) {
                            list = document.createElement('ul')
                            if (!currentList.lastElementChild) {
                                currentList.appendChild(document.createElement('li'))
                            }
                            currentList.lastElementChild.appendChild(list)
                            currentList = list
                            dirNum.push(0)
                        } else if (level < 0) {
                            level *= 2
                            while (level++) {
                                if (level % 2) dirNum.pop()
                                currentList = currentList.parentNode
                            }
                        }
                        dirNum[dirNum.length - 1]++
                        li = document.createElement('li')
                        link = document.createElement('a')
                        link.href = '#' + titleId[i]
                        link.innerHTML = !isDirNum ? contentArr[i]
                            : dirNum.join('.') + ' ' + contentArr[i]
                        li.appendChild(link)
                        currentList.appendChild(li)
                    }
                    directory.appendChild(root)
                }
                createPostDirectory(document.getElementById('post-content'), document.getElementById('directory'), true)
            }
            postDirectoryBuild()
        }
    }
}
</script>
<style src="../../../styles/style.min.css"></style>
<style src="../../../styles/xcode.min.css"></style>
<style scoped>
.content-index {
    padding: 0
}
::v-deep .comments .comments-content{border-color:#b2b2b5;border:1px solid #f0f0f0;border-radius:4px;margin-bottom:10px;overflow:hidden;position:relative;padding:10px}
::v-deep .el-input__inner{border:0;border-bottom:1px dashed #dedede}
::v-deep .el-textarea{padding:10px 0}
::v-deep .el-textarea__inner{border:0}.comments-count{padding:5px;font-weight:600;font-size:1.25em}
::v-deep .comments{}
::v-deep .comments-list{width:100%;font-family:Lato,"PingFang SC","Microsoft YaHei",sans-serif}
::v-deep .comments-list-item{padding-top:1.25em;position:relative;display:block;overflow:hidden;padding-bottom:.5em;border-bottom:1px dashed #f5f5f5}
::v-deep .comments-item-img{width:3.125em;height:3.125em;float:left;border-radius:50%;margin-right:.7525em;border:1px solid #f5f5f5;padding:.125em}
::v-deep .comments-list-item-view{overflow:hidden;padding-bottom:.5em;border-bottom:1px dashed #f5f5f5}
::v-deep .comments-item-head{line-height:1.5;margin-top:0}
::v-deep .comments-item-name{position:relative;font-size:.875em;font-weight:500;margin-right:.875em;cursor:pointer;text-decoration:none;display:inline-block}
::v-deep .comments-item-device{color:#929298;display:inline-block;padding:.2em .5em;font-size:.75em;border-radius:.2em;margin-right:.3em}
::v-deep .comments-item-time{font-size:.75em;margin-right:.875em;color:#929298}
::v-deep .comments-item-content{word-wrap:break-word;word-break:break-all;font-size:.875em;line-height:2;position:relative;margin-bottom:.75em;padding-top:.625em;color:#b2b2b5}
</style>
