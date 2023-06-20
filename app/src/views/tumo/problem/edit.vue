<template>
    <div v-if="isShow" class="app-container">
        <el-card>
            <el-form ref="form" :model="form" :rules="rulesForm" label-width="80px">
                <el-form-item label="题目标题" prop="title">
                    <el-input v-model="form.title" placeholder="请输入题目标题" @input="updateTitle"/>
                </el-form-item>
                <el-row :gutter="20">
                    <el-col :span="10">
                        <el-form-item label="文件夹" prop="category">
                            <el-select v-model="form.category" value-key="id" placeholder="请选择文件夹" style="width: 100%">
                                <el-option
                                    v-for="item in categoryList"
                                    :key="item.id"
                                    :label="item.name"
                                    :value="item"
                                />
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="14">
                        <el-form-item label="题目标签" prop="tags">
                            <el-select v-model="form.tags" value-key="id"
                                       :label="form.tags"
                                       multiple popper-append-to-body="false"
                                       placeholder="请选择题目标签" style="width: 100%">
                                <el-option v-for="item in tagList" :key="item.id" :label="item.name" :value="item"/>
                            </el-select>
                        </el-form-item>

                    </el-col>
                </el-row>
                <el-row :gutter="20">
                    <el-col :span="10">
                        <el-form-item label="公司部门" prop="organizations">
                            <el-select v-model="form.organizations" value-key="id" placeholder="请选择公司或部门" style="width: 100%">
                                <el-option
                                    v-for="item in organizationList"
                                    :key="item.id"
                                    :label="item.name"
                                    :value="item"
                                />
                            </el-select>
                        </el-form-item>

                    </el-col>
                    <el-col :span="14">
                        <el-form-item label="岗位" prop="positions">
                            <el-select v-model="form.positions" value-key="id"
                                       :label="form.positions"
                                       multiple popper-append-to-body="false"
                                       placeholder="请选择岗位" style="width: 100%">
                                <el-option v-for="item in positionList" :key="item.id" :label="item.name" :value="item"/>
                            </el-select>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col>
                        <el-form-item label="题目类型" prop="type">
                            <el-select v-model="form.type" @change="$forceUpdate()">
                                <el-option label="文字题" value=1></el-option>
                                <el-option label="算法题" value=2></el-option>
                            </el-select>
                        </el-form-item>
                        <el-form-item label="题目难度" prop="difficult">
                            <el-select v-model="form.difficult" @change="$forceUpdate()">
                                <el-option label="简单" value=1></el-option>
                                <el-option label="中等" value=2></el-option>
                                <el-option label="困难" value=3></el-option>
                            </el-select>
                        </el-form-item>
                        <el-form-item label="完成情况" prop="finished">
                            <el-select v-model="form.finished" @change="$forceUpdate()">
                                <el-option label="已完成" value=1></el-option>
                                <el-option label="未完成" value=2></el-option>
                            </el-select>
                        </el-form-item>
                        <el-form-item label="掌握程度" prop="stars">
                            <el-select v-model="form.stars" @change="$forceUpdate()">
                                <el-option label="一星" value=1></el-option>
                                <el-option label="二星" value=2></el-option>
                                <el-option label="三星" value=3></el-option>
                                <el-option label="四星" value=4></el-option>
                                <el-option label="五星" value=5></el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-form-item label="题目描述" prop="des">
                    <tinymce v-model="form.des" :height="300" />
                </el-form-item>
                <el-form-item label="代码块" prop="code" v-if="isCodeVisible">
                    <tinymce v-model="form.code" :height="300" />
                </el-form-item>
                <el-form-item label="笔记" prop="content">
                    <tinymce v-model="form.content" :height="300" />
                </el-form-item>
            </el-form>
            <el-button type="primary" @click="handleSubmit('form')">更新题目</el-button>
        </el-card>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Tinymce from '@/components/Tinymce'
import { getCategoryFilterList } from '@/api/category'
import { getTagFilterList } from '@/api/tag'
import { getProblemById, problemUpdate } from '@/api/problem'
import {getOrganizationFilterList} from "@/api/organization";
import {getPositionFilterList} from "@/api/position";

export default {
    name: 'Add',
    components: { Tinymce },
    computed: {
        ...mapGetters([
            'qiNiuUploadApi'
        ])
    },
    data() {
        return {
            isShow: false,
            content: '',
            form: {des: '', content: ''},
            category: [],
            tagList: [],
            organizationList: [],
            positionList: [],
            rulesForm: {
                title: [{ required: true, message: '请输入题目标题', trigger: 'blur' }],
                des: [{ required: true, message: '请输入题目描述', trigger: 'blur' }]
            },
            isCodeVisible: false
        }
    },
    watch: {
        'form.type'(newVal) {
            if (newVal===2) this.isCodeVisible=true;
            // 当题目类型为算法题时，isCodeVisible为true，否则为false
            else if (newVal===1) this.isCodeVisible=false;
        },
    },
    created() {
        const id = this.$route.params && this.$route.params.id
        this.fetchData(id)
    },
    methods: {
        async fetchData(id) {
            await getCategoryFilterList({}).then(res => {
                this.categoryList = res.data
                // this.$set(this.form.category,0,res.data)
            })
            await getTagFilterList({}).then(res => {
                this.tagList = res.data
                // this.$set(this.form.tag,0,res.data)
            })
            await getOrganizationFilterList({}).then(res => {
                this.organizationList = res.data
                // this.$set(this.form.category,0,res.data)
            })
            await getPositionFilterList({}).then(res => {
                this.positionList = res.data
                // this.$set(this.form.tag,0,res.data)
            })
            await getProblemById(id).then(res => {
                this.form.id = res.data.id
                this.form.title = res.data.title
                this.form.des = res.data.des
                this.form.code = res.data.code
                this.form.content = res.data.content
                //this.form.tags = res.data.tags
                this.form.catagory = res.data.catagory
                this.form.type = res.data.type
                if (this.form.type === 1) {
                    this.form.type = '文字题';
                } else if (this.form.type === 2) {
                    this.form.type = '算法题';
                    this.isCodeVisible=true;
                }
                this.form.difficult = res.data.difficult
                if (this.form.difficult === 1) {
                    this.form.difficult = '简单';
                } else if (this.form.difficult === 2) {
                    this.form.difficult = '中等';
                } else if (this.form.difficult === 3) {
                    this.form.difficult = '困难';
                }
                this.form.finished = res.data.finished
                if (this.form.finished === 1) {
                    this.form.finished = '已完成';
                } else if (this.form.finished === 2) {
                    this.form.finished = '未完成';
                }
                this.form.stars = res.data.stars
                if (this.form.stars === 1) {
                    this.form.stars = '一星';
                } else if (this.form.stars === 2) {
                    this.form.stars = '二星';
                } else if (this.form.stars === 3) {
                    this.form.stars = '三星';
                } else if (this.form.stars === 4) {
                    this.form.stars = '四星';
                } else if (this.form.stars === 5) {
                    this.form.stars = '五星';
                }
                console.log(res.data)
            })
            this.isShow=true
        },
        updateTitle(){
            this.$forceUpdate();
        },
        handleSubmit(formName) {
            if (this.form.type === '文字题') {
                this.form.type = 1;
            } else if (this.form.type === '算法题') {
                this.form.type = 2;
            }
            if (this.form.difficult === '简单') {
                this.form.difficult = 1;
            } else if (this.form.difficult === '中等') {
                this.form.difficult = 2;
            } else if (this.form.difficult === '困难') {
                this.form.difficult = 3;
            }
            if (this.form.finished === '已完成') {
                this.form.finished = 1;
            } else if (this.form.finished === '未完成') {
                this.form.finished = 2;
            }
            if (this.form.stars === '一星') {
                this.form.stars = 1;
            } else if (this.form.stars === '二星') {
                this.form.stars = 2;
            } else if (this.form.stars === '三星') {
                this.form.stars = 3;
            } else if (this.form.stars === '四星') {
                this.form.stars = 4;
            } else if (this.form.stars === '五星') {
                this.form.stars = 5;
            }
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    console.log("this form",this.form)
                    problemUpdate(this.form).then(res => {
                        if(this.form.type)
                            if (res.code === 200) {
                                this.$message.success('题目更新成功，即将跳转到题目列表页面')
                                setTimeout(function() {
                                    window.location.href = '/tumo/problem'
                                }, 400)
                            } else {
                                this.$message.error(res.msg)
                            }
                    })
                } else {
                    console.log('error submit!!')
                    return false
                }
            })
        }
    }
}
</script>

<style lang="scss" scoped>
</style>