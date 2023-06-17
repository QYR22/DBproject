import request from '@/utils/request'

export function getPositionList(data, query) {
    return request({
        url: `/position/list?page=${query.page}&limit=${query.limit}`,
        method: 'post',
        data
    })
}

export function getPositionFilterList(data) {
    return request({
        url: `/position/filter/list`,
        method: 'post',
        data
    })
}

export function getPositionById(id) {
    return request({
        url: `/position/${id}`,
        method: 'get'
    })
}

export function positionUpdate(data) {
    return request({
        url: `/position`,
        method: 'put',
        data
    })
}

export function positionAdd(data) {
    return request({
        url: `/position`,
        method: 'post',
        data
    })
}

export function positionDel(id) {
    return request({
        url: `/position/${id}`,
        method: 'delete'
    })
}
