<template >
    <div class="app-container">
<!--        <el-card>
        <el-form :model="form" size="large" label-width="150px">
            <el-form-item label="父文件夹" >
                <el-select v-model="form.value1"  placeholder="请选择父文件夹" @change="liandong">
                    <el-option
                        v-for="item in plist"
                        :key="item.id"
                        :label="item.name"
                        :value="item"></el-option>
                    &lt;!&ndash; @change在表单内容改变时 触发方法liandong 见method &ndash;&gt;
                </el-select>
            </el-form-item>
            <el-form-item label="子文件夹" >
                <el-select v-model="form.value2"  placeholder="请选择子文件夹" >
                    <el-option
                        v-for="item in slist"
                        :key="item.id"
                        :label="item.name"
                        :value="item"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="onSubmit">查 询</el-button>
            </el-form-item>
        </el-form>
        </el-card>
        -->

        <div :style="{'z-index':9999, position:'fixed', left: optionCardX+'px', top:optionCardY+'px',}"
             id="contextmenu" v-show="menuVisible">
            <el-button type="text" plain icon="el-icon-edit" @click="handleRename" class="option-card-button">重命名</el-button>
            <el-button type="text" plain icon="el-icon-plus" @click="handleAdd" class="option-card-button">新建category</el-button>
            <el-button type="text" plain icon="el-icon-delete" @click="handleDel" class="option-card-button">删除category</el-button>
        </div>
        <el-row :gutter="20">
            <el-col :span="6">
                <el-button type="primary" icon="el-icon-plus" plain @click="handleAddRoot">root category</el-button>

                <el-card shadow="hover">
                    <el-tree :data="treelist" :props="defaultProps" :expand-on-click-node="false"
                             node-key="id" highlight-current default-expand-all
                             @node-click="handleNodeClick"
                             @node-contextmenu="rightClickOperation" ref="menuTree">
                    <span class="custom-tree-node" slot-scope="{node,data}">
                        <i class="el-icon-folder" style="color: #DFBA49; font-size: 20px">
                    <span style="font-size: 16px; color:black; text-align: left">{{ node.label }}</span></i>
                </span>
            </el-tree>
<!--  handleNodeClick去查询-->
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
    </div>
</template>

<script>
import {
    categoryDel,
    getPCategotyFilterList,
    getSubCategories,
    selectAllWithTree,
    categoryAdd, categoryUpdate
} from '@/api/category'
import { findByCategory, findByCategoryPage, getProblemList } from '@/api/problem'

import Pagination from "@/components/Pagination";

export default {
    name: 'Index',
    components: { Pagination },
    data() {
        return {
            optionData:[],
            getResult:[],
            menuVisible:false,
            form: [],
            query: {},
            problemList: [],
            plist: [],
            slist: [],
            treelist: [],
            category: {
                id: null,
                uid: null,
                pid: 0,
                name: ""
            },
            optionCardX:'',
            optionCardY:'',
            defaultProps: {
                children: 'childrenTree',
                label: 'name'
            },
            pageConf: {
                page: 1,
                limit: 8,
                total: 0
            },
            baseUrl: window.location.origin
        }
    },
    created() {//eltree的data 在生成组件时就加载好
        this.fetchData()
    },// 在Vue组件的计算属性中添加以下代码
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
        fetchData() {//获取el-tree的树形数据
            selectAllWithTree({}).then(res =>{
                if(res.code === 200){
                    this.treelist = res.data
                    // TODO 这里放到后面处理查询数据
                    // console.log(res.data)
                }else {
                    this.$message.error(res.msg)
                }
            })//获取父文件夹名 OK的
                // getPCategotyFilterList({}).then(res => {
                //     if (res.code === 200) {
                //         this.plist = res.data
                //         // console.log(this.plist)
                //     } else {
                //         this.$message.error(res.msg)
                //     }
                // }),//这里是datafetch里面的每次都提前加载好第一个下拉列表参数
                // ,
                // getProblemList({}, this.pageConf).then(res => {
                //     if (res.code === 200) {
                //         // this.plist = res.data
                //         // console.log(this.plist)
                //         this.problemList = res.data.rows
                //         this.pageConf.total = res.data.total
                //     } else {
                //         this.$message.error(res.msg)
                //     }
                // }),
            findByCategoryPage(-1,this.pageConf).then(res =>{
                if(res.code === 200){
                    this.problemList = res.data.rows
                    this.pageConf.total = res.data.total
                    // console.log("findByCategoryPage",this.problemList)
                }else {
                    this.$message.error(res.msg)
                }
            })
        },
        //xxx 处理鼠标右击事件
        //node-contextmenu共四个参数 event
        // 传递给data属性的数组中该节点对应的对象
        //结点应的node
        // 节点组件本身
        rightClickOperation(mouseEvent,data,node,treelist) {
            console.log("rightclick")
            this.menuVisible = false
            this.optionData = data
            this.node = node // 将当前节点保存
            this.tree = treelist
            this.optionCardX = mouseEvent.x
            this.optionCardY = mouseEvent.y
            this.menuVisible = true  // 展示右键菜单
            var menu = document.querySelector('#contextmenu')
            document.addEventListener('click',this.foo)
            menu.style.left = MouseEvent.clientX - 160 + 'px'
            menu.style.top = MouseEvent.clientY - 10 + 'px'
        },
        //实现其他区域点击关闭右键菜单弹框
        foo() {
            this.menuVisible = false
            //及时关闭监听
            document.removeEventListener('click',this.foo)
            console.log("removed listener")
        },
        //两个联动下拉菜单的处理 在选中父菜单之后动态加载子菜单的数据
        liandong(pnode) {
            console.log(pnode)
            //调用后端接口
            console.log("id")
            console.log(pnode.id)
            var id = pnode.id
            getSubCategories(pnode.id).then(res => {
                console.log("getSubCategories")
                if (res.code === 200) {
                    this.slist = res.data
                    console.log(this.slist)
                } else {
                    this.$message.error(res.msg)
                    console.log("not")
                }
            })
        },
        // cancelChange(data) {
        //     this.category.name="";
        // },
        //点击某个节点时可以添加节点 要先缓存点击的结点
        handleNodeClick(data,node) {
            this.currentData = data//当前分类数据
            // this.currentNode = node//当前分类节点
            if(data !== undefined){
                console.log("handle click", data?.name);
                console.log("handle click", data.id);
                this.pageConf = { page: 1, limit: 8, total: 0}
                findByCategoryPage(data.id, this.pageConf).then(res =>{
                    if(res.code === 200){
                        console.log("data.id", data.id);
                        this.problemList = res.data.rows
                        this.pageConf.total = res.data.total
                        // console.log("problemList",this.problemList)
                        // console.log("pageconf",this.pageConf)
                    }else{
                        this.$message.error(res.msg)
                    }
                })
            }
        },
        //添加root 文件夹
        handleAddRoot() {
            this.CardShow=false;
            // 弹出框用于输入文件夹名
            this.$prompt('请输入new root category name','tip',{
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                inputPattern: /^\S{1,30}$/,
                inputErrorMessage: 'name长度between 1and30'
            }).then(({value}) => {
                    const newChild = {  // 新建一个子文件夹节点
                        id: null,   // 要在script中定义一个全局变量id
                        uid: null,
                        pid: 0,
                        name: value,
                    };
                    categoryAdd(newChild).then(res => {
                        if (res.code === 200) {
                            this.fetchData()
                            this.$message.success('添加成功')
                        } else {
                            this.$message.error(res.msg)
                        }
                    }).catch(() => {
                        this.$message.info('已取消添加')})
                }
            )
        },
        //处理新增分类文件夹节点
        handleAdd() { //成功！
            // console.log("handleadd")
            // console.log("要add的数据", this.optionData);
            this.CardShow=false;
            // 弹出框用于输入文件夹名
            this.$prompt('请输入新的category的name','tip',{
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                inputPattern: /^\S{1,30}$/,
                inputErrorMessage: 'name长度between 1and30'
            }).then(({value}) => {
                if (this.node.level >= 2) {
                    console.log("here!")
                    this.$message.error("只支持二级文件夹嵌套！！")
                    return false;
                }
                const newChild = {  // 新建一个子文件夹节点
                    id: null,   // 要在script中定义一个全局变量id
                    // uid:this.data.uid,
                    pid: this.optionData.id,
                    name: value,
                };
                categoryAdd(newChild).then(res => {
                    if (res.code === 200) {
                        this.fetchData()
                        this.$message.success('添加成功')
                    } else {
                        this.$message.error(res.msg)
                    }
                }).catch(() => {
                    this.$message.info('已取消添加')})
                }
            )
        },
        handleRename() {
            this.CardShow=false; // 弹出框用于输入文件夹名
            this.$prompt('请输入新的category的name','tip',{
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                inputPattern: /^\S{1,30}$/,
                inputErrorMessage: 'name长度between 1and30'
            }).then(({value}) => {
                    const newChild = {  // 新建一个子文件夹节点
                        id: this.optionData.id,   // 要在script中定义一个全局变量id
                        uid:this.optionData.uid,
                        pid: this.optionData.pid,
                        name: value,
                    };
                    console.log(newChild)
                    categoryUpdate(newChild).then(res => {
                        if (res.code === 200) {
                            this.fetchData()
                            this.$message.success('更新成功')
                        } else {
                            this.$message.error(res.msg)
                        }
                    }).catch(() => {
                        this.$message.info('已取消更新')})
                }
            )
        },
        handleDel() {
            findByCategory(this.optionData.id).then(res =>{
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
                // console.log("childrenTree",this.optionData.childrenTree)
                if(this.optionData.childrenTree !== undefined){
                    this.$message.error("有子文件夹哦,不可以删除父文件夹。可以先删除其子文件夹,再删root文件夹。")
                    return false;
                }
                //排除有子文件夹的父文件夹了 只有children=NULL时才可以删除
                //根据id删除
                categoryDel(this.optionData.id).then(res => {
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

<style>

/*.contextmenuItem{*/
/*    display: block;*/
/*    line-height: 20px;*/
/*    text-align: center;*/
/*    margin-top: 10px;*/
/*}*/
#contextmenu{
    height: 120px;
    width: 150px;
    /*position: absolute;*/
    border-radius: 20px;
    border: 1px solid rosybrown;
    background-color: white;
}
li:hover {
    background-color: #1790ff;
    color: white;
}
.option-card-button{
    width: 50%;
    align-content: center;
    margin-left: 0;
    font-size: 10px;
    border-radius: 0;
}

</style>
