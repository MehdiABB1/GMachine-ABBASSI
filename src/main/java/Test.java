import beans.Machine;
import beans.Salle;

import service.MachineService;
import service.SalleService;


public class Test {

	public static void main(String[] args) {
		MachineService ms = new MachineService();
		for(Machine m : ms.findAll()) {
			System.out.println(m.getReference());
		}
		SalleService vs = new SalleService();
		vs.create(new Salle("qq", "rr"));
		
		SalleService sas = new SalleService();
		for(Salle s : sas.findAll()) {
			System.out.println(s.getCode());
		}
	}
}
