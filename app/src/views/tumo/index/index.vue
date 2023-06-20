<template>
    <div class="dashboard-editor-container">
        <el-card class="welcome-card">
            <el-row :gutter="40">
                <el-card shadow="never" style="margin: 0 20px;">
                    <el-col :md="12" :sm="12" :lg="12">
                        <div class="welcome-text">
                            <pan-thumb :image="avatar" :height="'100px'" :width="'100px'" :hoverable="false" />
                            <div class="user-info">
                                <div class="random-message">
                                    <span id="welcome-message" v-html="welcomeMessage" />
                                </div>
                                <div class="user-login-info">
                                    {{ des }}
                                </div>
                            </div>
                        </div>
                    </el-col>
                </el-card>
            </el-row>
        </el-card>
        <el-row :gutter="10">
            <el-col :xs="24" :sm="24" :lg="12">
                <el-card>
                    <el-tabs v-model="activeName">
                        <el-tab-pane label="题目" name="first">
                            <el-table
                                v-loading="listLoading"
                                :data="problemList"
                                element-loading-text="Loading"
                                border
                                fit
                                size="mini"
                                highlight-current-row
                            >
                                <el-table-column label="标题">
                                    <template slot-scope="scope">
                                        {{ scope.row.title }}
                                    </template>
                                </el-table-column>
                                <el-table-column label="题目类型" width="80" align="center">
                                    <template slot-scope="scope">
                                        <span>{{ scope.row.type }}</span>
                                    </template>
                                </el-table-column>
                                <el-table-column label="跳转链接">
                                    <template slot-scope="scope">
                                        <router-link :to="'/tumo/archives/'+scope.row.id" style="padding-right: 10px;">
                                            <a :href="baseUrl + '/tumo/archives/' + scope.row.id" target="_blank">{{ baseUrl }}/p/{{ scope.row.id }}</a>
                                        </router-link>
                                    </template>
                                </el-table-column>
                            </el-table>
                        </el-tab-pane>

                    </el-tabs>
                </el-card>
            </el-col>
        </el-row>
    </div>
</template>

<script>
import { getProblemList } from '@/api/problem'
import { mapGetters } from 'vuex'
import PanThumb from '@/components/PanThumb'

export default {
    name: 'DashboardAdmin',
    components: {
        PanThumb
    },
    computed: {
        ...mapGetters([
            'avatar',
            'name',
            'des'
        ])
    },
    data() {
        return {
            problemList: null,
            listLoading: true,
            baseUrl: window.location.origin,
            listQuery: {
                page: 1,
                limit: 10
            },
            activeName: 'first',
            welcomeMessage: null
        }
    },
    created() {
        this.fetchData()
        this.init()
    },
    methods: {
        fetchData() {
            this.listLoading = true
            getProblemList({}, this.listQuery).then(response => {
                this.problemList = response.data.rows
                this.listLoading = false
            })
        },

        init() {
            var hour = new Date().getHours()
            var time = hour < 6 ? '☀🌞' : (hour <= 11 ? '上午好' : (hour <= 13 ? '中午好' : (hour <= 18 ? '🍺' : '🌠')))
            var welcomeArr = [
                '喝杯咖啡休息下吧☕',
                '🍺🥂🧋',
                '‍🌫️‍🌫️‍🌫️今天又写了几个Bug呢',
                '🍔🍟🌭🍿🍖🍗🥩🍦🍭',
                '👻🦄😶‍🌫️😶‍😊',
                '准备吃些什么呢',
                '周末要不要去看电影？'
            ]
            var index = Math.floor((Math.random() * welcomeArr.length))
            this.welcomeMessage = time + '，<a style="color: #5a8bff;">' + this.name + '</a>，' + welcomeArr[index]
        }

    }
}
</script>

<style lang="scss" scoped>
.dashboard-editor-container {
    padding: 32px;
    background-color: rgb(240, 242, 245);
    position: relative;

    .github-corner {
        position: absolute;
        top: 0;
        border: 0;
        right: 0;
    }

    .welcome-card {
        margin-bottom: 10px;
    }

    .welcome-text {
        color: rgba(0, 0, 0, 0.45);
        padding: .2rem;
        display: inline-block;

        .user-info {
            display: inline-block;
            vertical-align: top;
            padding: 25px;

            .random-message {
                font-size: 1rem;
                margin-bottom: 0.8rem;
                max-width: 21rem;
            }
        }
    }

    .news-text {
        float: right;
        padding: .2rem;

        .box-card {
            padding: 0 10px;
            display: inline-block;
            border: none;
            box-shadow: none !important;

            ::v-deep .el-card__header {
                border: none !important;
            }

            .box-num {
                font-size: 20px;
                font-weight: 700;
                color: #20a0ff;
            }
        }
    }

    .project-card {
        .project-item {
            padding: .5rem 0.7rem;
            border: 1px solid #f1f1f1;

            .project-name {
                width: 100%;
                height: 24px;

                a {
                    color: #42b983;
                    font-size: .9rem;
                    font-weight: 600;
                }
            }

            .project-desc {
                line-height: 24px;
                color: rgba(0, 0, 0, 0.45);
            }
        }
    }

    .info-card {
        margin-top: 10px;

        .info-item-card {
            ::v-deep .el-card {
                border-radius: 0;
                border: 1px solid #e6e6e6;
            }

            .info-header {
                display: inline-block;
                width: 80px;
            }

            .info-text {
                display: inline-block;

                a {
                    color: #5a8bff;
                }
            }
        }
    }
}

@media (max-width: 1024px) {
    .chart-wrapper {
        padding: 8px;
    }
}
</style>
