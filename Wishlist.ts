import { Column, CreateDateColumn, JoinColumn, OneToOne, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";
import { User } from "./User";
import { Product } from "./Product";

export class Wishlist{
    @PrimaryGeneratedColumn()
    wishlist_id!:number;

    @CreateDateColumn()
    createdAt!:Date;

    @OneToOne(()=>User,{nullable:false, onDelete:"CASCADE"})
    @JoinColumn({name:"user_id"})
    user!:User;


}