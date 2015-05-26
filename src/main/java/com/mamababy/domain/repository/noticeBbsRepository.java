package com.mamababy.domain.repository;

import com.mamababy.domain.Board.noticeBbs;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by hoy on 2015. 5. 21..
 */
@Repository
@Component
public interface noticeBbsRepository extends CrudRepository<noticeBbs, Long> {

    noticeBbs save(noticeBbs noticeBbs);

    List<noticeBbs> findAllByCategory(String category);

    noticeBbs findById(String id);

}
