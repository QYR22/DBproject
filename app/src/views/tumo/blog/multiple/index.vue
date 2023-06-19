<template>
    <div class="app-container">

        <el-card> <!-- @keyup.enter.native监听键盘回车事件 -->
            <el-form size="medium" :inline="true" :model="queryForm" ref="queryFormRef">
                <el-form-item>
                    题目难度
                    <el-select v-model=queryForm.difficult
                               size="medium" clearable style="width: 280px"
                               placeholder="请选择难度"
                               @clear="getDataList"
                               @change="getDataList">
                        <el-option label="简单" value=1></el-option>
                        <el-option label="中等" value=2></el-option>
                        <el-option label="困难" value=3></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                    完成情况
                    <el-select v-model=queryForm.finished
                               size="medium" clearable style="width: 280px"
                               placeholder="请选择完成情况"
                               @clear="getDataList"
                               @change="getDataList">
                        <el-option label="已完成" value=1></el-option>
                        <el-option label="未完成" value=2></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                    ⭐掌握程度
                    <el-select v-model=queryForm.stars
                               size="medium" clearable style="width: 280px"
                               placeholder="请选择掌握程度"
                               @clear="getDataList"
                               @change="getDataList">
                        <el-option label="一星" value=1></el-option>
                        <el-option label="二星" value=2></el-option>
                        <el-option label="三星" value=3></el-option>
                        <el-option label="四星" value=4></el-option>
                        <el-option label="五星" value=5></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                    时间范围
                    <el-select v-model=queryForm.lastEdit
                               size="medium" clearable
                               placeholder="请选择时间范围" style="width: 280px"
                               @clear="getDataList"
                               @change="getDataList">
                        <el-option label="近一周" :value="getPastDate(7)"></el-option>
                        <el-option label="近一个月" :value="getPastDate(30)"></el-option>
                        <el-option label="近一年" :value="getPastDate(365)"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                    text/code
                    <el-select v-model=queryForm.type
                               size="medium" clearable
                               placeholder="文字题or算法题" style="width: 250px"
                               @clear="getDataList"
                               @change="getDataList">
                        <el-option label="文字题" value=1></el-option>
                        <el-option label="算法题" value=2></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                    category
                    <el-cascader v-model=queryForm.categoryId
                                 :options="categoryTree"
                                 placeholder="category文件夹"
                                 clearable :props="catgProps"
                                 @clear="getDataList"
                                 @change="getDataList">
                    </el-cascader>
<!--                    <el-select v-model=categoryPId-->
<!--                               size="medium" clearable-->
<!--                               placeholder="父文件夹" style="width: 280px"-->
<!--                               @change="liandong">-->
<!--                        <el-option v-for="item in plist" :key="item.id" :label="item.name" :value="item.id"></el-option>-->
<!--                    </el-select>-->
<!--                    <el-select v-model=queryForm.categoryId-->
<!--                               size="medium" clearable-->
<!--                               placeholder="子文件夹" style="width: 280px"-->
<!--                               @clear="getDataList"-->
<!--                               @change="getDataList">-->
<!--                        <el-option v-for="item in slist" :key="item.id" :label="item.name" :value="item.id"></el-option>-->
<!--                    </el-select>-->
                </el-form-item>
                <el-form-item>
                    公司-部门
                    <el-cascader v-model=queryForm.organizationIds
                                 :options="organizationTree"
                                 placeholder="公司-部门"
                                 clearable :props="orgnProps"
                                 @clear="getDataList"
                                 @change="getDataList">
                    </el-cascader>
                </el-form-item>

                <el-form-item>
                    岗位
                    <el-select v-model=queryForm.positionIds
                               size="medium" clearable
                               placeholder="请选择岗位" style="width: 280px"
                               @clear="getDataList"
                               @change="getDataList">
                        <el-option v-for="item in positionList" :key="item.id" :label="item.name" :value="item.id"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                    other tags
                    <el-select v-model=queryForm.tagIds
                               size="max" clearable
                               placeholder="请选择其他标签" style="width: 280px"
                               @clear="getDataList"
                               @change="getDataList">
                        <el-option v-for="item in tagList" :key="item.id" :label="item.name" :value="item.id"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                    <el-button type="success" plain icon="el-icon-search" @click="getDataList">查询</el-button>
                    <el-button type="primary" plain icon="el-icon-refresh-left" @click="resetQueryForm">重置</el-button>
                </el-form-item>
            </el-form>

        </el-card>

        <el-card>
            <div class="table-responsive">
                <el-table
                    :data="list" tooltip-effect="dark"
                    style="width: 100%" size="mini">
                    <el-table-column prop="id" label="ID" width="55" ></el-table-column>
                    <el-table-column prop="title" label="题目" width="200" ></el-table-column>
                    <el-table-column prop="type" label="类型"  width="80">
                        <template slot-scope="scope">
                            {{ typeChange[scope.$index] }}
                        </template>
                    </el-table-column>
                    <el-table-column prop="difficult" label="难度" width="60" >
                        <template slot-scope="scope">
                            {{ difficultyLevels[scope.$index] }}
                        </template>
                    </el-table-column>
                    <el-table-column prop="finished" label="完成情况" width="90" >
                        <template slot-scope="scope">
                            {{ finishedChange[scope.$index] }}
                        </template>
                    </el-table-column>
                    <el-table-column prop="stars" label="⭐掌握程度" width="120px" align="center" >
                        <template slot-scope="scope">
                            {{ starsChange[scope.$index] }}
                        </template>
                    </el-table-column>
                    <el-table-column prop="lastEdit" label="最近修改时间" width="150" ></el-table-column>
                    <el-table-column prop="createTime" label="创建时间" width="150" ></el-table-column>
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

    </div>
</template>

<script>
import {findMulQuery, getProblemById, problemDel,getProblemList } from '@/api/problem'
import {getPCategotyFilterList, getSubCategories,selectAllWithTree} from '@/api/category'
import { getOrganizationFilterList,selectAllOrgnWithTree } from '@/api/organization'
import { getPositionFilterList } from '@/api/position'
import { getTagFilterList } from '@/api/tag'
import Pagination from '@/components/Pagination'

/* TODO 实现很多标签一起search */
export default {
    components: { Pagination },
    data() {
        return {
            queryForm: {//TODO dataForm
                difficult: null,
                finished: null,
                stars: null,
                lastEdit: null,
                type: null,
                categoryId: null,
                organizationIds:[],//装id吧
                positionIds:[],
                tagIds:[],
            },
            "categoryPId": null,
            list: [],//problem list 筛选结果
            pageConf: {page: 1, limit: 8, total: 0},
            baseUrl: window.location.origin,//跳转链接
            categoryList: [],
            positionList: [],
            organizationList: [],//TODO tree data
            tagList: [],
            dataListLoaded:false,
            dialogVisible: false,
            // plist: [],
            // slist: [],
            categoryTree: [],
            organizationTree: [],
            catgProps:{
                expandTrigger:'hover',
                emitPath:false,
                children: 'childrenTree',
                label: 'name',
                value:'id'
            },
            orgnProps:{
                expandTrigger:'hover',
                emitPath:false,
                children: 'childrenTree',
                label: 'name',
                value:'id'
            },
        }
    },
    created() {
        this.fetchData()
    },
    computed: {
        difficultyLevels() {
            return this.list.map(item => {
                switch (item.difficult) {
                    case 1: return '简单'
                    case 2: return '中等'
                    case 3: return '困难'
                    default: return '/'}
            })},
        finishedChange() {
            return this.list.map(item => {
                switch (item.finished) {
                    case 1: return '已完成'
                    case 2: return '未完成'
                    default: return '/'
                }})},
        typeChange() {
            return this.list.map(item => {
                switch (item.type) {
                    case 1: return '文字题'
                    case 2: return '算法题'
                    default: return '/'
                }})},
        starsChange() {
            return this.list.map(item => {
                switch (item.stars) {
                    case 0: return 'null'
                    case 1: return '⭐'
                    case 2: return '⭐⭐'
                    case 3: return '⭐⭐⭐'
                    case 4: return '⭐⭐⭐⭐'
                    case 5: return '⭐⭐⭐⭐⭐'
                    default: return '/'
                }})}
    },
    methods: {
        fetchData(){
            //提前加载好第一个下拉列表参数
            // getPCategotyFilterList({}).then(res => {
            //     if (res.code === 200) {
            //         this.plist = res.data
            //     } else {
            //         this.$message.error(res.msg)
            //     }
            // })
            selectAllWithTree({}).then(res=>{
                this.categoryTree = res.data
                // console.log(this.categoryTree)
            })
            selectAllOrgnWithTree({}).then(res=>{
                this.organizationTree = res.data
                console.log(this.organizationTree)
            })
            getPositionFilterList({}).then(res=>{
                this.positionList = res.data
            })
            getTagFilterList({}).then(res=>{
                this.tagList = res.data
            })
            getProblemList({},this.pageConf).then(res=>{
                this.list = res.data.rows
                this.pageConf.total = res.data.total
            })
        },
        getDataList(){
            console.log("queryForm", this.queryForm)
            const params = {...this.queryForm}//json对象

            // if(params.difficult ===null){params['difficult'] = -1}
            // if(params.finished ===null){params['finished'] = -1}
            // if(params.stars ===null){params['stars'] = -1}
            // if(params.lastEdit ===null){params['lastEdit'] = "2000-01-01 00:00:00"}
            // if(params.type ===null){params['type'] = -1}
            // if(params.categoryId ===null){params['categoryId'] = -1}
            // if(params.type ===null){params['type'] = -1}

            console.log("params", params)
            findMulQuery(params, this.pageConf).then(res =>{
                if (res.code === 200) {
                    console.log("list", this.list)
                    this.list = res.data.rows
                    this.pageConf.total = res.data.total
                    console.log("list:",this.list)
                } else {
                    this.$message.error(res.msg)
                }
            })
        },
        getPastDate(days) {
            const date = new Date();
            date.setDate(date.getDate() - days);
            const formattedDate = date.toISOString().split('T')[0] + ' 00:00:00'; // 转换为 "yyyy-MM-dd 00:00:00" 格式
            return formattedDate;
        },
        resetQueryForm() {
            this.$router.go(0)
        },
        //两个联动下拉菜单的处理 在选中父菜单之后动态加载子菜单的数据
        // liandong(pid) {
        //     console.log("pid",pid)
        //     //调用后端接口
        //     getSubCategories(pid).then(res => {
        //         console.log("getSubCategories")
        //         if (res.code === 200) {
        //             this.slist = res.data
        //             console.log(this.slist)
        //         } else {
        //             this.$message.error(res.msg)
        //             console.log("not")
        //         }
        //     })
        // },
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
            this.$confirm('确定永久删除此数据？, 是否继续?', '提示', {
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
                    }})
            }).catch(() => {
                this.$message.info('已取消删除')
            })
        },

    },
}
</script>
