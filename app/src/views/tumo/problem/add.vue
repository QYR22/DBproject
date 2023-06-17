<template>
    <div class="app-container">
        <el-card>
            <el-form ref="form" :model="form" :rules="rulesForm" label-width="80px">
                <el-form-item label="题目标题" prop="title">
                    <el-input v-model="form.title" placeholder="请输入题目标题" />
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
                            <el-select v-model="form.tags" value-key="id" multiple placeholder="请选择题目标签" style="width: 100%">
                                <el-option
                                    v-for="item in tagList"
                                    :key="item.id"
                                    :label="item.name"
                                    :value="item"
                                />
                            </el-select>
                        </el-form-item>
                    </el-col>
                </el-row>
              <el-row>
                <el-col>
                  <el-form-item label="题目类型" prop="type">
                    <el-select v-model="form.type">
                      <el-option label="文字题" value=1></el-option>
                      <el-option label="算法题" value=2></el-option>
                    </el-select>
                  </el-form-item>
                  <el-form-item label="题目难度" prop="difficult">
                    <el-select v-model="form.difficult">
                      <el-option label="简单" value=1></el-option>
                      <el-option label="中等" value=2></el-option>
                      <el-option label="困难" value=3></el-option>
                    </el-select>
                  </el-form-item>
                  <el-form-item label="完成情况" prop="finished">
                    <el-select v-model="form.finished">
                      <el-option label="已完成" value=1></el-option>
                      <el-option label="未完成" value=2></el-option>
                    </el-select>
                  </el-form-item>
                  <el-form-item label="掌握程度" prop="stars">
                    <el-select v-model="form.stars">
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
                <el-form-item label="题目解答" prop="content">
                    <tinymce v-model="form.content" :height="300" />
                </el-form-item>
            </el-form>
            <el-button type="primary" @click="handleSubmit('form')">发布题目</el-button>
        </el-card>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Tinymce from '@/components/Tinymce'
import { getCategoryFilterList } from '@/api/category'
import { getTagFilterList } from '@/api/tag'
import { problemAdd } from '@/api/problem'

export default {
    name: 'Add',
    components: { Tinymce },
    computed: {
        ...mapGetters([
            'qiNiuUploadApi'
        ]),
        starsChange() {
          return this.list.map(item => {
            switch (item.stars) {
              case 0: return '/'
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
    data() {
        return {
            content: '',
            form: {},
            categoryList: [],
            tagList: [],
            rulesForm: {
                title: [
                    { required: true, message: '请输入题目标题', trigger: 'blur' }
                ],
                des: [
                    { required: true, message: '请输入题目描述', trigger: 'blur' }
                ]
            },
          isCodeVisible: false
        }
    },
    watch: {
      'form.type'(newVal) {
        if (newVal==2) this.isCodeVisible=true;// 当题目类型为算法题时，isCodeVisible为true，否则为false
        if (newVal==1) this.isCodeVisible=false;
      },
    },
    created() {
        this.fetchData()
    },
    methods: {
        fetchData() {
            getCategoryFilterList({}).then(res => {
                this.categoryList = res.data
            })
            getTagFilterList({}).then(res => {
                this.tagList = res.data
            })
        },
        handleSubmit(formName) {
            //this.$refs一个对象 存储所有使用ref属性定义的子组件orDOM元素的引用
            //this.$refs[formName]用于访问指定名称的子组件orDOM元素的引用
            //formName表单名称
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    const formData = {
                        ...this.form
                    }
                    problemAdd(formData).then(res => {
                        if (res.code === 200) {
                            this.$message.success('题目添加成功，即将跳转到题目列表页面')
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
