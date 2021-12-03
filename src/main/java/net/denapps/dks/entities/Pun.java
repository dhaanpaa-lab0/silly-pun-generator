package net.denapps.dks.entities;

import io.quarkus.hibernate.orm.panache.PanacheEntity;

import javax.persistence.Entity;

@Entity
public class Pun extends PanacheEntity {
    public String punTitle;
}
