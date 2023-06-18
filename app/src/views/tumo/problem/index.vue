<template>
    <div class="app-container">
        <el-card>
            <el-form size="medium" :inline="true">
                <el-form-item>
                    <el-input v-model="textQuery" placeholder="请输入题目标题查询" style="width: 300px" />
                </el-form-item>
            </el-form>
        </el-card>
        <el-card>
            <el-form size="medium" :inline="true">
                <!-- DONE 这里是题目关键字匹配 -->
                <el-form-item>
                    <el-input v-model=query.title placeholder="请输入题目标题查询" style="width: 300px" />
                </el-form-item>
                <el-form-item>
                  <el-select v-model=query.difficult placeholder="请选择难度" style="width: 280px">
                    <el-option label="简单" value=1></el-option>
                    <el-option label="中等" value=2></el-option>
                    <el-option label="困难" value=3></el-option>
                  </el-select>
                </el-form-item>
              <el-form-item>
                <el-select v-model=query.finished placeholder="请选择完成情况" style="width: 280px">
                  <el-option label="已完成" value=1></el-option>
                  <el-option label="未完成" value=2></el-option>
                </el-select>
              </el-form-item>
                <el-form-item>
                    <el-select v-model=query.stars placeholder="请选择掌握程度" style="width: 280px">
                        <el-option label="一星" value=1></el-option>
                        <el-option label="二星" value=2></el-option>
                        <el-option label="三星" value=3></el-option>
                        <el-option label="四星" value=4></el-option>
                        <el-option label="五星" value=5></el-option>
                    </el-select>
                </el-form-item>

                <el-form-item>
                    <el-select v-model=query.type placeholder="请选择类型" style="width: 280px">
                        <el-option label="文字题" value=1></el-option>
                        <el-option label="算法题" value=2></el-option>
                    </el-select>
                    <el-form-item style="padding: 0;margin: 0">
                        <el-button type="success" icon="el-icon-search" @click="fetchData" />
                    </el-form-item>
                </el-form-item>
            </el-form>
            <div class="table-responsive">
                <el-table
                    :data="list"
                    tooltip-effect="dark"
                    style="width: 100%"
                    size="mini">
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
import { getProblemList, getProblemById, problemDel } from '@/api/problem'
import Pagination from '@/components/Pagination'
/* TODO 上次编辑“最近” 近一周 近一年 的显示
*   创建新题目时标星
* 创建题目时选择category需要是父子选择or只选择父文件夹 */
export default {
    components: { Pagination },
    data() {
        return {
            list: [],
            pageConf: {page: 1, limit: 8, total: 0},
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
                    case 1: return '简单'
                    case 2: return '中等'
                    case 3: return '困难'
                    default: return '/'
                }
            })
        },
        finishedChange() {
          return this.list.map(item => {
            switch (item.finished) {
              case 1: return '已完成'
              case 2: return '未完成'
              default: return '/'
            }
          })
        },
        typeChange() {
            return this.list.map(item => {
                switch (item.type) {
                    case 1: return '文字题'
                    case 2: return '算法题'
                    default: return '/'
                }
            })
        },
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
                }
            })
        }
    },
    methods: {
        handleClose() {
            this.dialogVisible = false
            this.form = {}
        },
        fetchData(query) {
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
