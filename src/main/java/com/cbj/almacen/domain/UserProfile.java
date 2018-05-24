package com.cbj.almacen.domain;

import javax.persistence.*;

@Entity
@Table(name="authorities")
public class UserProfile {




    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int iduserrol;

    @Column(name="username",  nullable=false)
    private String username;

    @Column(name="authority",  nullable=false)
    private String type = UserProfileType.ADMIN.getUserProfileType();


    public int getIduserrol() {
        return iduserrol;
    }

    public void setIduserrol(int iduserrol) {
        this.iduserrol = iduserrol;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }




    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (!(obj instanceof UserProfile))
            return false;
        UserProfile other = (UserProfile) obj;
        if (username != other.username)
            return false;
        if (type == null) {
            if (other.type != null)
                return false;
        } else if (!type.equals(other.type))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "UserProfile [Username=" + username + ",  type=" + type	+ "]";
    }



}
