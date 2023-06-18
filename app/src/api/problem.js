import request from '@/utils/request'

export function findByCategory(id) {
  return request({
    url: `/problem/findByCategory/${id}`,
    method: 'get'
  })
}
export function findByOrganization(id) {
    return request({
        url: `/problem/findByOrganization/${id}`,
        method: 'get'
    })
}
export function findByPosition(id) {
    return request({
        url: `/problem/findByPosition/${id}`,
        method: 'get'
    })
}
export function findByTag(id) {
    return request({
        url: `/problem/findByTag/${id}`,
        method: 'get'
    })
}



//DONE
export function findByCategoryPage(id, query) {
    return request({
        url: `/problem/findByCategoryPage/${id}?page=${query.page}&limit=${query.limit}`,
        method: 'get',
    })
}
export function findByOrganizationPage(id, query) {
    return request({
        url: `/problem/findByOrganizationPage/${id}?page=${query.page}&limit=${query.limit}`,
        method: 'get',
    })
}
export function findByPositionPage(id, query) {
    return request({
        url: `/problem/findByPositionPage/${id}?page=${query.page}&limit=${query.limit}`,
        method: 'get',
    })
}
export function findByTagPage(id, query) {
    return request({
        url: `/problem/findByTagPage/${id}?page=${query.page}&limit=${query.limit}`,
        method: 'get',
    })
}

export function getProblemList(data, query) {
    return request({
        url: `/problem/list?page=${query.page}&limit=${query.limit}`,
        method: 'post',
        data
    })
}
export function getProblemById(id) {
  return request({
    url: `/problem/${id}`,
    method: 'get'
  })
}

export function getProblemAll(data, query) {
    return request({
        url: `/problem/all?page=${query.page}&limit=${query.limit}`,
        method: 'post',
        data
    })
}

export function problemUpdate(data) {
  return request({
    url: `/problem`,
    method: 'put',
    data
  })
}

export function problemAdd(data) {
  return request({
    url: `/problem`,
    method: 'post',
    data
  })
}

export function problemDel(id) {
  return request({
    url: `/problem/${id}`,
    method: 'delete'
  })
}
