package org.cloud.pointsys.test.jackson;

public class BaseEntity {

    protected int id;
    
    protected int version;

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
