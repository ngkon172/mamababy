package com.mamababy.domain.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.mamababy.domain.Board.Bbs;

@Component
@Service
@Repository
public class BbsService implements BbsRepository {

	private static final int PAGE_SIZE = 10;

	@Autowired
	private BbsRepository bbsRepo;

	@Override
	public Bbs save(Bbs bbs) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Bbs> findByCategory(String category, Pageable pagerequest) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void increseHit(String no) {
		// TODO Auto-generated method stub

	}

	@Override
	public String findArticleCntByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	public Page<Bbs> getBbsLog(Integer pageNumber, String category) {
		PageRequest req = new PageRequest(pageNumber - 1, PAGE_SIZE,
				Sort.Direction.DESC, "no");

		return bbsRepo.findByCategory(category, req);
	}

	@Override
	public void deleteAllInBatch() {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteInBatch(Iterable<Bbs> arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Bbs> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Bbs> findAll(Sort arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Bbs> findAll(Iterable<Long> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void flush() {
		// TODO Auto-generated method stub

	}

	@Override
	public Bbs getOne(Long arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends Bbs> List<S> save(Iterable<S> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends Bbs> S saveAndFlush(S arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Bbs> findAll(Pageable arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void delete(Long arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Bbs arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Iterable<? extends Bbs> arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean exists(Long arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Bbs findOne(Long arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Bbs findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long count(Specification<Bbs> arg0) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Bbs> findAll(Specification<Bbs> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Bbs> findAll(Specification<Bbs> arg0, Pageable arg1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Bbs> findAll(Specification<Bbs> arg0, Sort arg1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Bbs findOne(Specification<Bbs> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

}
