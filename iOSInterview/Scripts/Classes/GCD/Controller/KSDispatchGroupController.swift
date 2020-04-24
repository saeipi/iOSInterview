//
//  KSDispatchGroupController.swift
//  iOSInterview
//
//  Created by saeipi on 2020/4/24.
//  Copyright © 2020 saeipi. All rights reserved.
//

import UIKit

class KSDispatchGroupController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue = DispatchQueue(label: "iOSInterview.com.queue")
        queue.async {
            KSLog.log(Thread.current)
        }
        // Do any additional setup after loading the view.
    }
    
    /// 网络请求调度组
      private func datasRequestGroup1() {
          // 创建调度组
          let workingGroup = DispatchGroup()
          // 创建多列
          let workingQueue = DispatchQueue(label: "request_queue")
          
          // 模拟异步发送网络请求 A
          // 入组
          workingGroup.enter()
          workingQueue.async {
              Thread.sleep(forTimeInterval: 1)
              print("接口 A 数据请求完成")
              // 出组
              workingGroup.leave()
          }
          
          // 模拟异步发送网络请求 B
          // 入组
          workingGroup.enter()
          workingQueue.async {
              Thread.sleep(forTimeInterval: 1)
              print("接口 B 数据请求完成")
              // 出组
              workingGroup.leave()
          }
          
          print("我是最开始执行的，异步操作里的打印后执行")
          
          // 调度组里的任务都执行完毕
          workingGroup.notify(queue: workingQueue) {
              print("接口 A 和接口 B 的数据请求都已经完毕！, 开始合并两个接口的数据")
          }
      }
}
