class stimulus extends uvm_component;
  
  `uvm_component_utils(stimulus)
  
  seq_item xtn;
  
  uvm_blocking_put_port #(seq_item) stim_put_port;
  
  function new(string name = "stimulus", uvm_component parent);
    super.new(name,parent);
    xtn = seq_item::type_id::create("xtn");
    stim_put_port = new("stim_put_port",this);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    repeat(5)
      begin
        assert(xtn.randomize());
        stim_put_port.put(xtn);
        `uvm_info(get_name(),$sformatf("Stimulus: Value = %0d",xtn.value),UVM_NONE);
        #15;
      end
  endtask
  
endclass