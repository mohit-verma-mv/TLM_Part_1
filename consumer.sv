class consumer extends uvm_component;
  
  `uvm_component_utils(consumer)
  
  driver drv;
  
  uvm_tlm_fifo #(seq_item) tlm_fifo_c;
  
  uvm_blocking_put_export #(seq_item) con_put_export;
  
  function new(string name = "consumer", uvm_component parent);
    super.new(name,parent);
    tlm_fifo_c = new("tlm_fifo_c",this);
    con_put_export = new("con_put_export",this);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = driver::type_id::create("drv",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //E
    this.con_put_export.connect(tlm_fifo_c.put_export);
    //F
    drv.drv_get_port.connect(tlm_fifo_c.get_export);
  endfunction
  
endclass