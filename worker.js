onmessage = function(e) {
  let person = {
    name:e.data[0],
    age:e.data[1]
  }
  postMessage(person);// 向主线程返回数据
}
