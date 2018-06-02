//
//  ViewController.swift
//  luyin
//
//  Created by 杨静伟 on 2018/5/5.
//  Copyright © 2018年 firstleap. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  lazy var recorder: AVAudioRecorder? = {
    let url = NSURL(string: "/Users/yangjingwei/Desktop/test.caf")
    let config: [String: AnyObject] = [
      // 编码格式
      AVFormatIDKey: NSNumber(value: Int32(kAudioFormatLinearPCM)),
      // 采样率
      AVSampleRateKey: NSNumber(value: 11025.0),
      // 通道数
      AVNumberOfChannelsKey: NSNumber(value: 2),
      // 录音质量
      AVEncoderAudioQualityKey: NSNumber(value: Int32(AVAudioQuality.min.rawValue))
      
    ]
    do{
      let recorder = try AVAudioRecorder(url: url! as URL, settings: config)
      recorder.prepareToRecord()
      return recorder
    } catch {
      print(error)
      return nil
    }
  }()
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    recorder?.record(atTime: (recorder?.deviceCurrentTime)! + 2, forDuration: 3)
    
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if (recorder?.currentTime)! > 2 {
      recorder?.stop()
    } else {
      recorder?.stop()
      recorder?.deleteRecording()
    }
    recorder?.stop()
  }
}

