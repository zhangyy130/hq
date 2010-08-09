package com.vmware.springsource.hyperic.plugin.gemfire;

import java.util.Map;

public class GatewayServerDetector extends MemberDetector {

    boolean isValidMember(Map memberDetails) {
        return "true".equalsIgnoreCase(memberDetails.get("gemfire.member.isgateway.boolean").toString());
    }
}
