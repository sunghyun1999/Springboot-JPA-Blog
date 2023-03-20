package com.cos.blog.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Board {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, length = 100)
    private String title;
    
    @Lob // 대용량 데이터
    private String content;

    private int count;

    @ManyToOne(fetch = FetchType.EAGER) // Board = Many, User = One
    @JoinColumn(name = "userId")
    private User user; // DB는 오브젝트를 저장할 수 없다. 자바는 오브젝트를 저장할 수 있다.

    @OneToMany(mappedBy = "board", fetch = FetchType.EAGER) // mappedBy: 연관관계의 주인이 아니므로, DB에 컬럼을 만들지 않는다.
    @JsonIgnoreProperties({"board"})
    @OrderBy("id desc")
    private List<Reply> replies;

    @CreationTimestamp
    private Timestamp createDate;
}
