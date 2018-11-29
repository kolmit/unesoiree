pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E072 : Short_Integer; pragma Import (Ada, E072, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exception_table_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__io_exceptions_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__strings_E");
   E040 : Short_Integer; pragma Import (Ada, E040, "ada__containers_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exceptions_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "interfaces__c_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__strings__maps_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__strings__maps__constants_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__soft_links__initialize_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "system__object_reader_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "system__dwarf_lines_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "system__traceback__symbolic_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "ada__numerics_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__tags_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "ada__streams_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "system__file_control_block_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__finalization_root_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "ada__finalization_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "system__file_io_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "system__storage_pools_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "system__finalization_masters_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "ada__text_io_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "system__pool_global_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "interface_observercalculator_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "interface_observerpressure_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "interface_strategiefilter_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "filter_airbus_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "filter_boeing_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "filter_dassault_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "interface_strategievitesse_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "objetancetre_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "externaladm_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "pressurecalculator_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "adm_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "pressuresensor_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "vitesse_ecoulementcompressible_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "vitesse_ecoulementincompressible_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E175 := E175 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "vitesse_ecoulementincompressible__finalize_spec");
      begin
         F1;
      end;
      E172 := E172 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "vitesse_ecoulementcompressible__finalize_spec");
      begin
         F2;
      end;
      E170 := E170 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "pressuresensor__finalize_spec");
      begin
         F3;
      end;
      E115 := E115 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "adm__finalize_spec");
      begin
         F4;
      end;
      E148 := E148 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "pressurecalculator__finalize_spec");
      begin
         F5;
      end;
      E157 := E157 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "externaladm__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "interface_strategievitesse__finalize_spec");
      begin
         E168 := E168 - 1;
         F7;
      end;
      E167 := E167 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "filter_dassault__finalize_spec");
      begin
         F8;
      end;
      E165 := E165 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "filter_boeing__finalize_spec");
      begin
         F9;
      end;
      E163 := E163 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "filter_airbus__finalize_spec");
      begin
         F10;
      end;
      declare
         procedure F11;
         pragma Import (Ada, F11, "interface_strategiefilter__finalize_spec");
      begin
         E146 := E146 - 1;
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "interface_observerpressure__finalize_spec");
      begin
         E158 := E158 - 1;
         F12;
      end;
      declare
         procedure F13;
         pragma Import (Ada, F13, "interface_observercalculator__finalize_spec");
      begin
         E135 := E135 - 1;
         F13;
      end;
      E143 := E143 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "system__pool_global__finalize_spec");
      begin
         F14;
      end;
      E103 := E103 - 1;
      declare
         procedure F15;
         pragma Import (Ada, F15, "ada__text_io__finalize_spec");
      begin
         F15;
      end;
      E137 := E137 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "system__finalization_masters__finalize_spec");
      begin
         F16;
      end;
      declare
         procedure F17;
         pragma Import (Ada, F17, "system__file_io__finalize_body");
      begin
         E109 := E109 - 1;
         F17;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E025 := E025 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E068 := E068 + 1;
      Ada.Strings'Elab_Spec;
      E052 := E052 + 1;
      Ada.Containers'Elab_Spec;
      E040 := E040 + 1;
      System.Exceptions'Elab_Spec;
      E027 := E027 + 1;
      Interfaces.C'Elab_Spec;
      System.Os_Lib'Elab_Body;
      E072 := E072 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E058 := E058 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E021 := E021 + 1;
      E013 := E013 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E047 := E047 + 1;
      E078 := E078 + 1;
      E054 := E054 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E039 := E039 + 1;
      E080 := E080 + 1;
      Ada.Numerics'Elab_Spec;
      E116 := E116 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E006 := E006 + 1;
      Ada.Streams'Elab_Spec;
      E105 := E105 + 1;
      System.File_Control_Block'Elab_Spec;
      E113 := E113 + 1;
      System.Finalization_Root'Elab_Spec;
      E112 := E112 + 1;
      Ada.Finalization'Elab_Spec;
      E110 := E110 + 1;
      System.File_Io'Elab_Body;
      E109 := E109 + 1;
      System.Storage_Pools'Elab_Spec;
      E141 := E141 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E137 := E137 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E103 := E103 + 1;
      System.Pool_Global'Elab_Spec;
      E143 := E143 + 1;
      Interface_Observercalculator'Elab_Spec;
      E135 := E135 + 1;
      Interface_Observerpressure'Elab_Spec;
      E158 := E158 + 1;
      Interface_Strategiefilter'Elab_Spec;
      E146 := E146 + 1;
      Filter_Airbus'Elab_Spec;
      Filter_Airbus'Elab_Body;
      E163 := E163 + 1;
      Filter_Boeing'Elab_Spec;
      Filter_Boeing'Elab_Body;
      E165 := E165 + 1;
      Filter_Dassault'Elab_Spec;
      Filter_Dassault'Elab_Body;
      E167 := E167 + 1;
      Interface_Strategievitesse'Elab_Spec;
      E168 := E168 + 1;
      Objetancetre'Elab_Spec;
      E159 := E159 + 1;
      Externaladm'Elab_Spec;
      Externaladm'Elab_Body;
      E157 := E157 + 1;
      Pressurecalculator'Elab_Spec;
      Pressurecalculator'Elab_Body;
      E148 := E148 + 1;
      ADM'ELAB_SPEC;
      ADM'ELAB_BODY;
      E115 := E115 + 1;
      Pressuresensor'Elab_Spec;
      Pressuresensor'Elab_Body;
      E170 := E170 + 1;
      Vitesse_Ecoulementcompressible'Elab_Spec;
      Vitesse_Ecoulementcompressible'Elab_Body;
      E172 := E172 + 1;
      Vitesse_Ecoulementincompressible'Elab_Spec;
      Vitesse_Ecoulementincompressible'Elab_Body;
      E175 := E175 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\interface_observercalculator.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\interface_observerpressure.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\interface_strategiefilter.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\filter_airbus.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\filter_boeing.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\filter_dassault.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\interface_strategievitesse.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\objetancetre.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\externaladm.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\physicconstants.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\pressurecalculator.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\adm.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\pressuresensor.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\vitesse_ecoulementcompressible.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\vitesse_ecoulementincompressible.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\main.o
   --   -LC:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\
   --   -LC:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\
   --   -LC:/gnat/2018/lib/gcc/x86_64-pc-mingw32/7.3.1/adalib/
   --   -static
   --   -lgnat
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
