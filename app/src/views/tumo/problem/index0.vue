<template>
    <div class="app-container">
        <el-card>
            <el-form size="mini" :inline="true">
                <!-- TODO 这里是题目关键字匹配 -->
                <el-form-item>
                    <el-input v-model="query.title" placeholder="请输入题目标题关键字查询" style="width: 300px" />
                </el-form-item>
                <el-form-item style="padding: 0;margin: 0">
                    <el-button type="success" icon="el-icon-search" @click="fetchData" />
                </el-form-item>
            </el-form>
            <div class="table-responsive">
                <el-table
                    :data="list"
                    tooltip-effect="dark"
                    style="width: 100%"
                    size="mini"
                >
                    <el-table-column prop="id" label="ID" width="55" />
                    <!--5555可算是调出来了莫名其妙的刚刚-->
                    <el-table-column prop="lastEdit" label="lastEdit" width="100" />
                    <el-table-column prop="title" label="Title" />
                    <!--<el-table-column prop="author" label="作者" />-->
                    <el-table-column prop="type" label="类型" />
                    <el-table-column prop="stars" label="掌握程度" />
                    <el-table-column prop="difficult" label="难度" >
                        <template slot-scope="scope">
                            {{ difficultyLevels[scope.$index] }}
                        </template>
                    </el-table-column>
                    <el-table-column label="链接">
                        <template slot-scope="scope">
                            <router-link :to="'/archives/'+scope.row.id" style="padding-right: 10px;">
                                <a :href="baseUrl + '/archives/' + scope.row.id" target="_blank">{{ baseUrl }}/p/{{ scope.row.id }}</a>
                            </router-link>
                        </template>
                    </el-table-column>
                    <el-table-column label="操作" width="100">
                        <template slot-scope="scope">
                            <router-link :to="'/tumo/problem/edit/'+scope.row.id" style="padding-right: 10px;">
                                <el-button type="text" icon="el-icon-edit" />
                            </router-link>
                            <el-button type="text" icon="el-icon-delete" @click="handleDel(scope.row.id)" />
                        </template>
                    </el-table-column>
                </el-table>
            </div>
            <pagination v-show="pageConf.total>0" :total="pageConf.total" :page.sync="pageConf.page" :limit.sync="pageConf.limit" @pagination="fetchData" />
        </el-card>
    </div>
</template>

<script>
import { getProblemList, getProblemById, problemDel } from '@/api/problem'
import Pagination from '@/components/Pagination'

export default {
    components: { Pagination },
    data() {
        return {
            list: [],
            pageConf: {
                page: 1,
                limit: 8,
                total: 0
            },
            baseUrl: window.location.origin,
            query: {},
            categoryList: [],
            tagList: [],
            dialogVisible: false
        }
    },
    created() {
        this.fetchData()
    },
    // 在Vue组件的计算属性中添加以下代码
    computed: {
        difficultyLevels() {
            return this.list.map(item => {
                switch (item.difficult) {
                    case 1:
                        return '简单'
                    case 2:
                        return '中等'
                    case 3:
                        return '困难'
                    default:
                        return ''
                }
            })
        }
    },
    methods: {
        handleClose() {
            this.dialogVisible = false
            this.form = {}
        },
        fetchData() {
            getProblemList(this.query, this.pageConf).then(res => {
                if (res.code === 200) {
                    this.list = res.data.rows
                    this.pageConf.total = res.data.total
                } else {
                    this.$message.error(res.msg)
                }
            })
        },

        handleEdit(id) {
            getProblemById(id).then(res => {
                if (res.code === 200) {
                    this.form = res.data
                    this.dialogVisible = true
                } else {
                    this.$message.error(res.msg)
                }
            })
        },
        handleDel(id) {
            this.$confirm('你确定永久删除此数据？, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                problemDel(id).then(res => {
                    if (res.code === 200) {
                        this.fetchData()
                        this.$message.success('删除成功')
                    } else {
                        this.$message.error(res.msg)
                    }
                })
            }).catch(() => {
                this.$message.info('已取消删除')
            })
        }
    }
}
</script>
