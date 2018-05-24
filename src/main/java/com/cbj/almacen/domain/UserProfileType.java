package com.cbj.almacen.domain;

public enum UserProfileType {
    ADMISION("ADMISION"),
    OPERACION("OPERACION"),
    ADMINSION("ADMINSION"),
    ALMACENISTA("ALMACENISTA"),
    COMERCIAL("COMERCIAL"),
    AUDITORIA("AUDITORIA"),
    FACTURACION("FACTURACION"),
    COMERCIAL_GERENTE("COMERCIAL_GERENTE"),
    MAQUILA("MAQUILA"),
    TIF("TIF"),
    VIGILANTE("VIGILANTE"),
    ADMIN("ADMIN");

    String userProfileType;

    private UserProfileType(String userProfileType){
        this.userProfileType = userProfileType;
    }

    public String getUserProfileType(){
        return userProfileType;
    }
}
