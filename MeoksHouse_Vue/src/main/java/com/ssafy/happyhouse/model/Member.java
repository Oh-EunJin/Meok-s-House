package com.ssafy.happyhouse.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "Member : Member 정보", description = "Member 상세 정보를 나타낸다.")
public class Member {
	
	@ApiModelProperty(value = "회원 아이디")
    private String login_id;
	@ApiModelProperty(value = "비밀번호")
    private String password;
	@ApiModelProperty(value = "회원 이름")
    private String name;
	@ApiModelProperty(value = "주소")
    private String address;
	@ApiModelProperty(value = "전화번호")
    private String phone_number;

    public Member() { }
    
    public Member(String login_id, String password, String name, String address, String phone_number) {
		super();
		this.login_id = login_id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone_number = phone_number;
	}

    public String getLogin_id() {
        return login_id;
    }

    public void setLogin_id(String login_id) {
        this.login_id = login_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    @Override
    public String toString() {
        return "Member{" +
                ", login_id='" + login_id + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", phone_number='" + phone_number + '\'' +
                '}';
    }
}
