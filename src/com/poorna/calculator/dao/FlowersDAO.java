package com.poorna.calculator.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorna.calculator.model.Flowers;

@Repository
public class FlowersDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	public List<Flowers> getAllFlowers() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Flowers> FlowersList = session.createQuery("from Flowers").list();
		return FlowersList;
	}

	public Flowers getFlowers(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Flowers Flowers = (Flowers) session.get(Flowers.class, new Integer(id));
		return Flowers;
	}

	public Flowers addFlowers(Flowers Flowers) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(Flowers);
		return Flowers;
	}

	public void updateFlowers(Flowers Flowers) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(Flowers);
	}

	public void deleteFlowers(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Flowers p = (Flowers) session.load(Flowers.class, new Integer(id));
		if (null != p) {
			session.delete(p);
		}
	}	
}
