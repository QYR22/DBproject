import request from '@/utils/request'

export function getCommentList(data, query) {
  return request({
    url: `/comment/list?page=${query.page}&limit=${query.limit}`,
    method: 'post',
    data
  })
}

export function getByProblem(id) {
  return request({
    url: `/comment/findByProblem/${id}`,
    method: 'get'
  })
}

export function commentDel(id) {
  return request({
    url: `/comment/${id}`,
    method: 'delete'
  })
}

export function commentAdd(data) {
  return request({
    url: `/comment`,
    method: 'post',
    data
  })
}
