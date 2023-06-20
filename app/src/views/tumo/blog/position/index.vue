<template>
    <div class="app-container">
        <el-row :gutter="20">
            <el-col :span="6">
                <el-card shadow="hover">
                    <el-form size="mini" :inline="true">
                        <el-form-item>
                            <el-input v-model="query.name" placeholder="输入标签关键词查询标签" />
                        </el-form-item>
                        <el-form-item style="padding: 0;margin: 0">
                            <el-button type="success" icon="el-icon-search" @click="fetchData" />
                            <el-button type="primary" icon="el-icon-plus" @click="$refs.model.fetchData()" />
                        </el-form-item>
                    </el-form>
                    <el-tree
                        ref="tree"
                        :data="list"
                        highlight-current
                        node-key="id"
                        @node-click="handleNodeChange">
            <span slot-scope="{ node, data }" class="custom-tree-node">
              <span>{{ data.name }}</span>
              <span>
                <!-- 这里的是用model的fetchData !!注意安全!! -->
                <el-button type="text" size="mini" icon="el-icon-edit" @click="() => $refs.model.fetchData(data.id)" />
                <el-button type="text" size="mini" icon="el-icon-delete" @click="() => handleDel(node, data)" />
              </span>
            </span>
                    </el-tree>
                </el-card>
            </el-col>

            <el-col :span="18">
                <el-card>
                    <div class="table-responsive">
                        <el-table :data="problemList" tooltip-effect="dark" style="width: 100%" size="mini">
                            <el-table-column prop="id" label="ID" width="55" ></el-table-column>
                            <el-table-column prop="title" label="题目" width="200" ></el-table-column>
                            <el-table-column prop="type" label="类型"  width="80">
                                <template slot-scope="scope">
                                    {{ typeChange[scope.$index] }}
                                </template>
                            </el-table-column>
                            <el-table-column prop="stars" label="⭐掌握程度" width="120px" align="center" >
                                <template slot-scope="scope">
                                    {{ starsChange[scope.$index] }}
                                </template>
                            </el-table-column>
                            <el-table-column prop="difficult" label="难度" width="60" >
                                <template slot-scope="scope">
                                    {{ difficultyLevels[scope.$index] }}
                                </template>
                            </el-table-column>
                            <el-table-column prop="lastEdit" label="最近修改时间" width="150" ></el-table-column>
                            <el-table-column label="跳转链接">
                                <template slot-scope="scope">
                                    <router-link :to="'/tumo/archives/'+scope.row.id" style="padding-right: 10px;">
                                        <a :href="baseUrl + '/tumo/archives/' + scope.row.id" target="_blank">{{ baseUrl }}/p/{{ scope.row.id }}</a>
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
            </el-col>
        </el-row>
        <model ref="model" @refresh="fetchData" />
    </div>
</template>

<script>
import { getPositionFilterList, positionDel } from '@/api/position'
import {findByPositionPage,findByPosition} from '@/api/problem'

import Model from './components/model'
import Pagination from "@/components/Pagination";
export default {
    name: 'Index',
    components: { Model,Pagination },
    data() {
        return {
            list: [],
            query: {},
            problemList: [],
            pageConf: {page: 1, limit: 8, total: 0},
            baseUrl: window.location.origin,
            getResult:[]
        }
    },
    created() {
        this.fetchData()
    },
    computed: {
        difficultyLevels() {
            return this.problemList.map(item => {
                switch (item.difficult) {
                    case 1:return '简单'
                    case 2:  return '中等'
                    case 3:  return '困难'
                    default:  return ''
                }
            })
        },
        typeChange() {
            return this.problemList.map(item => {
                switch (item.type) {
                    case 1: return '文字题'
                    case 2: return '算法题'
                    default: return ''
                }
            })
        },starsChange() {
            return this.problemList.map(item => {
                switch (item.stars) {
                    case 0: return 'null'
                    case 1: return '⭐'
                    case 2: return '⭐⭐'
                    case 3: return '⭐⭐⭐'
                    case 4: return '⭐⭐⭐⭐'
                    case 5: return '⭐⭐⭐⭐⭐'
                    default: return 'null'
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
            //岗位列表
            getPositionFilterList(this.query).then(res => {
                if (res.code === 200) {
                    this.list = res.data
                } else {
                    this.$message.error(res.msg)
                }
            })//初始是要显示所有题目的 就是没有筛选的结果
            findByPositionPage(-1,this.pageConf).then(res =>{
                if(res.code === 200){
                    this.problemList = res.data.rows
                    this.pageConf.total = res.data.total
                    console.log("findByPositionPage",this.problemList)
                }else {
                    this.$message.error(res.msg)
                }
            })

        },
        handleNodeChange(data, node) {
            this.pageConf = { page: 1, limit: 8, total: 0}
            findByPositionPage(data.id,this.pageConf).then(res => {
                this.problemList = res.data.rows
                this.pageConf.total = res.data.total;
            })
        },
        handleDel(node, data) {
            findByPosition(data.id).then(res =>{
                this.getResult = res.data
                if(this.getResult.length!==0){
                    this.$message.warning("WARNNING!!有关联problem")
                }else{
                    this.$message.warning("检查过了哦 没有关联problem")
                }
                console.log("find", this.getResult )
            })
            this.$confirm('你确定永久删除此数据？, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                positionDel(data.id).then(res => {
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

<style scoped>
.custom-tree-node{flex:1;display:flex;align-items:center;justify-content:space-between;font-size:14px;padding-right:8px}.el-tree{margin-left:-24px}
</style>
