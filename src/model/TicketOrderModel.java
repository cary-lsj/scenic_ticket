package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.TicketOrderVO;

/*
 * TicketOrderModel��
 * ��ticket_order�������ķ�װ
 * */
public class TicketOrderModel extends ModelBase {

	/**
	 * ��ö�����������
	 */
	public List<TicketOrderVO> getAllTicketOrder() {
		// ��֯sql��� ��ѯticket_order������
		String sql = "select * from ticket_order";
		// ִ��sql���
		ResultSet res = conn.executeQuery(sql);

		// ʵ����list�����б� ���洢TicketOrderVO�������ݰ�
		List<TicketOrderVO> list = new ArrayList<TicketOrderVO>();
		try {
			// ��ȡ��һ������ ֱ����ȡ�����һ��
			while (res.next()) {
				// ����TicketOrderVO�������ݰ�
				TicketOrderVO vo = new TicketOrderVO();
				// ��res�������ӵ�TicketOrderVO�������ݰ���
				vo.update(res);
				// �����ݰ����ӵ�list�����б���
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ����list�����б�
		return list;
	}

	/**
	 * ���ݶ���id��ö�������
	 */
	public TicketOrderVO getTicketOrder(String id) {
		// ��֯sql��� ��ѯticket_order�������� idΪָ��id��һ������
		String sql = "select * from ticket_order where id='" + id + "'";
		// ִ��sql���
		ResultSet res = conn.executeQuery(sql);
		try {
			if (res.next()) {
				// ����TicketOrderVO�������ݰ�
				TicketOrderVO vo = new TicketOrderVO();
				// ��res�������ӵ�TicketOrderVO�������ݰ���
				vo.update(res);
				// ����TicketOrderVO�������ݰ�
				return vo;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ʧ��ʱ����null������
		return null;
	}

	/**
	 * ���� ��ϵ������֤ ��ö�������
	 */
	public TicketOrderVO getTicketOrderbyIdCard(String id) {
		// ��֯sql��� ��ѯticket_order�������� idΪָ��id��һ������
		String sql = "select * from ticket_order where user_id_card='" + id + "'";
		// ִ��sql���
		ResultSet res = conn.executeQuery(sql);
		try {
			if (res.next()) {
				// ����TicketOrderVO�������ݰ�
				TicketOrderVO vo = new TicketOrderVO();
				// ��res�������ӵ�TicketOrderVO�������ݰ���
				vo.update(res);
				// ����TicketOrderVO�������ݰ�
				return vo;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ʧ��ʱ����null������
		return null;
	}

	/**
	 * ��ticket_order�������Ӷ���
	 */
	public int addTicketOrder(TicketOrderVO vo) {

		// ����sql��� ִ�в�����������
		String sql = "insert into ticket_order (user_name,user_id,enter_time,phone,children_num,adults_num,user_id_card,scenic_id) values('"
				+ vo.user_name + "','" + vo.user_id + "','" + vo.enter_time + "','" + vo.phone + "','" + vo.children_num
				+ "','" + vo.adults_num + "','" + vo.user_id_card + "','" + vo.scenic_id + "')";
		// ִ��sql��� ��num���շ���ֵ �������ݵ�����
		int num = conn.executeInsert(sql);
		// ����num�������ݵ�����
		return num;
	}
}