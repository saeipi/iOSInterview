//
//  KSSemaphoreController.swift
//  iOSInterview
//
//  Created by saeipi on 2020/4/30.
//  Copyright © 2020 saeipi. All rights reserved.
//

import UIKit

class KSSemaphoreController: KSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override class func description() -> String {
        return "多个有依赖的网络请求"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        semaphore()
    }

    func semaphore() {
        
        // 方案1
        // 创建一个并发队列
        //let queue = DispatchQueue(label: "saeipi.com", attributes: .concurrent)
        // 创建一个串行队列
        let queue = DispatchQueue(label: "saeipi.com")
        //初始化信号量为1
        let semaphore = DispatchSemaphore(value: 1)
        print("异步操作加入第1个网络请求")
        queue.async() {[weak self] in
            semaphore.wait()
            self?.httpRequest(semaphoreLock: semaphore, index: 1)
        }
        
        print("异步操作加入第2个网络请求")
        queue.async() {[weak self] in
            semaphore.wait()
            self?.httpRequest(semaphoreLock: semaphore, index: 2)
        }
        
        print("异步操作加入第3个网络请求")
        queue.async() {[weak self] in
            semaphore.wait()
            self?.httpRequest(semaphoreLock: semaphore, index: 3)
        }
        print("调用网络请求结束")
        
        /*
        //方案2
        //创建串行队列
        let customQuue = DispatchQueue(label: "saeipi.com")
        //初始化信号量为0
        let semaphoreLock: DispatchSemaphore = DispatchSemaphore(value: 0)
        
        customQuue.async(execute: { [weak self] in
            self?.httpRequest(semaphoreLock: semaphoreLock, index: 0)
            _ = semaphoreLock.wait(timeout: DispatchTime.distantFuture)
            
            self?.httpRequest(semaphoreLock: semaphoreLock, index: 1)
            _ = semaphoreLock.wait(timeout: DispatchTime.distantFuture)
            
            self?.httpRequest(semaphoreLock: semaphoreLock, index: 2)
            _ = semaphoreLock.wait(timeout: DispatchTime.distantFuture)
            DispatchQueue.main.async(execute: {
                print("请求完成")
            })
        })
         */
        
    }
    
    func httpRequest(semaphoreLock: DispatchSemaphore, index: Int) {
        Thread.sleep(forTimeInterval: TimeInterval(4 - index))
        let url = URL.init(string: "https://www.baidu.com/")!
        let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, respons, error) in
            print("\(index)任务: 请求完成")
            semaphoreLock.signal()
        }
        dataTask.resume()
    }

}
