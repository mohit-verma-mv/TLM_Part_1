class producer extends uvm_component;
  
  `uvm_component_utils(producer)
  
  stimulus stim;
  converter conv;
  
  uvm_tlm_fifo #(seq_item) tlm_fifo_p;
  
  uvm_blocking_put_port #(seq_item) pro_put_port;
  
  function new(string name = "producer", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    tlm_fifo_p = new("tlm_fifo_p",this);
    pro_put_port = new("pro_put_port",this);
    stim = stimulus::type_id::create("stim",this);
    conv = converter::type_id::create("conv",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //A
    stim.stim_put_port.connect(tlm_fifo_p.put_export);
    //B
    conv.conv_get_port.connect(tlm_fifo_p.get_export);
    //C
    conv.conv_put_port.connect(this.pro_put_port);
  endfunction
  
endclass