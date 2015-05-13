package com.mamababy.domain.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.mamababy.domain.Board.Bbs;
import com.mamababy.domain.Board.BbsDao;


@Component
@Repository("BbsDao")
@Transactional
public class HibernateBbsDAo implements BbsDao {

	// @Autowired
	// private SessionFactory sessionFactory;

	// @Override
	// public Long save(Bbs b) {
	// // TODO Auto-generated method stub
	// return (Long) ().save(b); }
	//
	// @Override
	// public void delete(Bbs b) {
	// // TODO Auto-generated method stub
	// getHibernateTemplate().delete(b);
	// }
	//
	// @Override
	// public void update(Bbs b) {
	// // TODO Auto-generated method stub
	// getHibernateTemplate().update(b);
	// }
	//
	// @Override
	// public Bbs findById(Long id) {
	// // TODO Auto-generated method stub
	// return (Bbs)getHibernateTemplate().get(Bbs.class, id);
	// }
	//
	// @SuppressWarnings("unchecked")
	// @Override
	// public List<Bbs> listAll() {
	//
	// return (List<Bbs>) getHibernateTemplate().find("from Bbs b");
	// }

	@Override
	@SuppressWarnings("unchecked")
	public List<Bbs> listAll(int pageNum) {
		int pageSize = 3;
		SessionFactory sessionFactory = new Configuration().configure()
				.buildSessionFactory();
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("from bbs");

		query = query.setFirstResult((pageNum - 1) * pageSize);
		query.setMaxResults(pageSize);

		return (List<Bbs>) query;
	}

}
