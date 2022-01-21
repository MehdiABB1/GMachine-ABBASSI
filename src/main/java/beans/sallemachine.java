package beans;

public class sallemachine {
	  private int id;
	    private String reference;
	    private String code;
		public sallemachine(int id, String reference, String code) {
			super();
			this.id = id;
			this.reference = reference;
			this.code = code;
		}
		public sallemachine(String reference, String code) {
			super();
			this.reference = reference;
			this.code = code;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getReference() {
			return reference;
		}
		public void setReference(String reference) {
			this.reference = reference;
		}
		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		}
		@Override
		public String toString() {
			return "sallemachine [id=" + id + ", reference=" + reference + ", code=" + code + "]";
		}
	    
		
}
