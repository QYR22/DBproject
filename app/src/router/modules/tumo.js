/* 博客后台路由
 */

import Layout from '@/layout'
const API_BASE = process.env.VUE_APP_API_BASE

const tumoRouter = [
    {
        path: '/tumo',
        component: Layout,
        redirect: '/tumo/index',
        children: [{
            path: 'index',
            name: 'tumoIndex',
            component: () => import('@/views/tumo/index/index'),
            meta: { title: '首页', icon: 'dashboard' }
        }]
    },

    {
        path: '/tumo/profile',
        component: Layout,
        redirect: '/tumo/profile/index',
        hidden: true,
        children: [
            {
                path: 'index',
                component: () => import('@/views/tumo/profile/index'),
                name: 'Profile',
                meta: { title: 'Profile', icon: 'el-icon-edit', noCache: true }
            }
        ]
    },
    {
      path: '/tumo/archives/:id(\\d+)',
      component: Layout,
      hidden: true,
      redirect: 'noRedirect',
      children: [{
        path: '',
        name: 'siteArchives',
        component: () => import('@/views/site/archives/index')
      }]
    },
    {
        path: '/tumo/problem',
        component: Layout,
        name: 'tumoProblem',
        redirect: '/tumo/problem/list',
        meta: {
            title: '题目管理',
            icon: 'form'
        },
        children: [
            {
                path: 'add',
                component: () => import('@/views/tumo/problem/add'),
                name: 'tumoProblemAdd',
                meta: { title: '撰写题目', icon: 'el-icon-edit' }
            },
            {
                path: 'edit/:id(\\d+)',
                component: () => import('@/views/tumo/problem/edit'),
                name: 'tumoProblemEdit',
                meta: { title: '题目编辑', noCache: true },
                hidden: true
            },
            {
                path: 'list',
                component: () => import('@/views/tumo/problem/index'),
                name: 'tumoProblemList',
                meta: { title: '题目列表', icon: 'el-icon-sort' }
            }
        ]
    },
    {
        path: '/tumo/blog',
        component: Layout,
        name: 'tumoBlog',
        meta: {
            title: '分类管理',
            icon: 'filter'
        },
        children: [
            {
                path: 'category',
                component: () => import('@/views/tumo/blog/category/index'),
                name: 'tumoBlogCategory',
                meta: { title: '文件夹管理', icon: 'el-icon-edit' }
            },
            {
                path: 'organization',
                component: () => import('@/views/tumo/blog/organization/index'),
                name: 'organization',
                meta: { title: '公司-部门标签管理', icon: 'el-icon-sort' }
            },
            {
                path: 'position',
                component: () => import('@/views/tumo/blog/position/index'),
                name: 'position',
                meta: { title: '岗位标签管理', icon: 'el-icon-menu' }
            },
            {
                path: 'tag',
                component: () => import('@/views/tumo/blog/tag/index'),
                name: 'tumoBlogTag',
                meta: { title: '标签添加+筛选', icon: 'el-icon-star-off' }
            },
            {
                path: 'multiple',
                component: () => import('@/views/tumo/blog/multiple/index'),
                name: 'tumoBlogMultiple',
                meta: { title: '全局筛选', icon: 'el-icon-edit' }
            }
        ]
    },

    {
        path: '/tumo/setting',
        component: Layout,
        name: 'tumoSetting',
        meta: {
            title: '系统管理',
            icon: 'setting'
        },
        children: [
            {
                path: 'log',
                component: () => import('@/views/tumo/setting/log/index'),
                name: 'tumoSettingLog',
                meta: { title: '操作日志', icon: '' }
            },
            {
                path: 'qiniu',
                component: () => import('@/views/tumo/setting/qiniu/index'),
                name: 'tumoSettingQiniu',
                meta: { title: '七牛云', icon: '' }
            },
            {
                path: API_BASE + '/swagger-ui.html',
                name: 'tumoSettingSwagger',
                meta: { title: 'Swagger', icon: '' }
            }
        ]
    }
]

export default tumoRouter

