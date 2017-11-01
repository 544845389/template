package com.project.interceptor;

import com.baichang.framework.interceptor.BaseMobileRESTAPIInterceptorAdapter;

import java.util.List;

/**
 * \* Created with IntelliJ IDEA.
 * \* User: 侯存路
 * \* Date: 2017/10/31
 * \* Time: 21:36
 * \* To change this template use File | Settings | File Templates.
 * \* Description:
 * \
 */
public class MobileInterceptorAdapter extends BaseMobileRESTAPIInterceptorAdapter {


    @Override
    public void loadVerificationPath(List<String> verificationPath) {

        // 不需要拦截的接口
        verificationPath.add("/mobile/user/agentLogin");
    }


}