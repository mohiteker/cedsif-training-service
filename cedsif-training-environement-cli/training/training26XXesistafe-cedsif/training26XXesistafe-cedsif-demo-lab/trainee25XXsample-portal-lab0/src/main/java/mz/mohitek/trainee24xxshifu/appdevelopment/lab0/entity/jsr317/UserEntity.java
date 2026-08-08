/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.jsr317;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author shifu
 */
@Entity
@Table(name = "user_authentication")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserEntity.findAll", query = "SELECT u FROM UserEntity u")
    , @NamedQuery(name = "UserEntity.findById", query = "SELECT u FROM UserEntity u WHERE u.id = :id")
    , @NamedQuery(name = "UserEntity.findByName", query = "SELECT u FROM UserEntity u WHERE u.name = :name")
    , @NamedQuery(name = "UserEntity.findByAccount", query = "SELECT u FROM UserEntity u WHERE u.account = :account")
    , @NamedQuery(name = "UserEntity.findByCredential", query = "SELECT u FROM UserEntity u WHERE u.credential = :credential")
    , @NamedQuery(name = "UserEntity.findByActive", query = "SELECT u FROM UserEntity u WHERE u.active = :active")})
public class UserEntity extends mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.Entity<Integer> implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id")
    private Integer id;
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "account")
    private String account;
    @Column(name = "credential")
    private String credential;
    @Column(name = "active")
    private Character active;
    
    public UserEntity() {
    }

    public UserEntity(Integer pk) {
        super(pk);
    }

        public Character getActive() {
        return active;
    }

    public void setActive(Character active) {
        this.active = active;
    }
    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(final String account) {
        this.account = account;
    }

    public String getCredential() {
        return credential;
    }

    public void setCredential(final String credential) {
        this.credential = credential;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (account != null ? account.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserEntity)) {
            return false;
        }
        UserEntity other = (UserEntity) object;
        if ((this.account == null && other.account != null) || (this.account != null && !this.account.equals(other.account))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mz.mohitek.trainee24xxshifu.appdevelopment.lab0.entity.jsr317.UserEntity[ account=" + account + " ]";
    }
    
}
