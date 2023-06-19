import request from '@/utils/request'

export function getOrganizationList(data, query) {
    return request({
        url: `/organization/list?page=${query.page}&limit=${query.limit}`,
        method: 'post',
        data
    })
}
//获取所有父文件夹
export function getPCategotyFilterList(data){
    return request({
        url: `/organization/filter/plist`,
        method: 'post',
        data
    })
}

export function getOrganizationFilterList(data) {
    return request({
        url: `/organization/filter/list`,
        method: 'post',
        data
    })
}
//树形！！
export function selectAllOrgnWithTree(data) {
    return request({
        url: `/organization/selectAllOrgnWithTree`,
        method: 'post',
        data
    })
}
export function getOrganizationById(id) {
    return request({
        url: `/organization/${id}`,
        method: 'get'
    })
}




export function getSubOrganizations(id) {
    return request({
        url: `/organization/getSubOrganizations/${id}`,
        method: 'get'
    })
}

export function organizationUpdate(data) {
    return request({
        url: `/organization`,
        method: 'put',
        data
    })
}

export function organizationAdd(data) {
    return request({
        url: `/organization`,
        method: 'post',
        data
    })
}

export function organizationDel(id) {
    return request({
        url: `/organization/${id}`,
        method: 'delete'
    })
}
