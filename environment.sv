class environment extends uvm_env;
  
  `uvm_component_utils(environment)
  
  producer pro;
  consumer con;
  
  function new(string name = "environment", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    pro = producer::type_id::create("pro",this);
    con = consumer::type_id::create("con",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //D
    pro.pro_put_port.connect(con.con_put_export);
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
  
endclass