//
//  globaldefine.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#ifndef CMySignalApp_globaldefine_h
#define CMySignalApp_globaldefine_h

enum
{
    USER_TYPE_TEMP  = 0,
    USER_TYPE_NORMAL,
    USER_TYPE_WORKER,
    USER_TYPE_OTHER
};


enum
{
    created     = 0,
    submited    = 1,
    beginning   = 2,
    ending      = 3,
    other
};

enum
{
    SERVER_RESULT_FAILED = 0,
    SERVER_RESULT_SUCC,
    SERVER_RESULT_OTHER
};

enum
{
    WORKER_ORDER_STATUS_FINISHED    = 0,    // 以完成
    WORKER_ORDER_STATUS_BEGINNING,          // 正在施工
    WORKER_ORDER_STATUS_READY,              // 等待施工
    WORKER_ORDER_STATUS_WAITING,            // 等待用户确认
    WORKER_ORDER_STATUS_OTHER               // 其他
};

enum
{
    USER_ORDER_STATUS_FINISHED  = 0,        // 以完成
    USER_ORDER_STATUS_BEGINNING,            // 正在施工
    USER_ORDER_STATUS_READY,                // 等待施工
    USER_ORDER_STATUS_WAITING_CONFIRM,      // 等待用户确认（三次握手）
    USER_ORDER_STATUS_WAIT_CONTEND,         // 等待美容师抢单
};


#endif
