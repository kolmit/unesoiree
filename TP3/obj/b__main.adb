pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E074 : Short_Integer; pragma Import (Ada, E074, "system__os_lib_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__soft_links_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exception_table_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "ada__io_exceptions_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__strings_E");
   E042 : Short_Integer; pragma Import (Ada, E042, "ada__containers_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "system__exceptions_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "interfaces__c_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "ada__strings__maps_E");
   E060 : Short_Integer; pragma Import (Ada, E060, "ada__strings__maps__constants_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__soft_links__initialize_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "system__object_reader_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "system__dwarf_lines_E");
   E041 : Short_Integer; pragma Import (Ada, E041, "system__traceback__symbolic_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "ada__numerics_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "ada__tags_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "ada__streams_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "system__file_control_block_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "system__finalization_root_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "ada__finalization_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "system__file_io_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "system__storage_pools_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "system__finalization_masters_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "system__storage_pools__subpools_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__calendar_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar__delays_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "ada__text_io_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "system__pool_global_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "interface_observercalculator_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "interface_observerpressure_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "interface_strategiefilter_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "filter_airbus_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "filter_boeing_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "filter_dassault_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "interface_strategievitesse_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "objetancetre_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "externaladm_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "pressurecalculator_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "adm_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "pressuresensor_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "vitesse_ecoulementcompressible_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "vitesse_ecoulementincompressible_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "speedformulaselector_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E179 := E179 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "speedformulaselector__finalize_spec");
      begin
         F1;
      end;
      E190 := E190 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "vitesse_ecoulementincompressible__finalize_spec");
      begin
         F2;
      end;
      E181 := E181 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "vitesse_ecoulementcompressible__finalize_spec");
      begin
         F3;
      end;
      E177 := E177 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "pressuresensor__finalize_spec");
      begin
         F4;
      end;
      E124 := E124 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "adm__finalize_spec");
      begin
         F5;
      end;
      E158 := E158 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "pressurecalculator__finalize_spec");
      begin
         F6;
      end;
      E173 := E173 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "externaladm__finalize_spec");
      begin
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "interface_strategievitesse__finalize_spec");
      begin
         E156 := E156 - 1;
         F8;
      end;
      E169 := E169 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "filter_dassault__finalize_spec");
      begin
         F9;
      end;
      E167 := E167 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "filter_boeing__finalize_spec");
      begin
         F10;
      end;
      E160 := E160 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "filter_airbus__finalize_spec");
      begin
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "interface_strategiefilter__finalize_spec");
      begin
         E155 := E155 - 1;
         F12;
      end;
      declare
         procedure F13;
         pragma Import (Ada, F13, "interface_observerpressure__finalize_spec");
      begin
         E174 := E174 - 1;
         F13;
      end;
      declare
         procedure F14;
         pragma Import (Ada, F14, "interface_observercalculator__finalize_spec");
      begin
         E154 := E154 - 1;
         F14;
      end;
      E141 := E141 - 1;
      declare
         procedure F15;
         pragma Import (Ada, F15, "system__pool_global__finalize_spec");
      begin
         F15;
      end;
      E112 := E112 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "ada__text_io__finalize_spec");
      begin
         F16;
      end;
      E147 := E147 - 1;
      declare
         procedure F17;
         pragma Import (Ada, F17, "system__storage_pools__subpools__finalize_spec");
      begin
         F17;
      end;
      E149 := E149 - 1;
      declare
         procedure F18;
         pragma Import (Ada, F18, "system__finalization_masters__finalize_spec");
      begin
         F18;
      end;
      declare
         procedure F19;
         pragma Import (Ada, F19, "system__file_io__finalize_body");
      begin
         E118 := E118 - 1;
         F19;
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
      E027 := E027 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E070 := E070 + 1;
      Ada.Strings'Elab_Spec;
      E054 := E054 + 1;
      Ada.Containers'Elab_Spec;
      E042 := E042 + 1;
      System.Exceptions'Elab_Spec;
      E029 := E029 + 1;
      Interfaces.C'Elab_Spec;
      System.Os_Lib'Elab_Body;
      E074 := E074 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E060 := E060 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E023 := E023 + 1;
      E015 := E015 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E049 := E049 + 1;
      E080 := E080 + 1;
      E056 := E056 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E041 := E041 + 1;
      E082 := E082 + 1;
      Ada.Numerics'Elab_Spec;
      E125 := E125 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E106 := E106 + 1;
      Ada.Streams'Elab_Spec;
      E114 := E114 + 1;
      System.File_Control_Block'Elab_Spec;
      E122 := E122 + 1;
      System.Finalization_Root'Elab_Spec;
      E121 := E121 + 1;
      Ada.Finalization'Elab_Spec;
      E119 := E119 + 1;
      System.File_Io'Elab_Body;
      E118 := E118 + 1;
      System.Storage_Pools'Elab_Spec;
      E145 := E145 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E149 := E149 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E147 := E147 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E008 := E008 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E006 := E006 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E112 := E112 + 1;
      System.Pool_Global'Elab_Spec;
      E141 := E141 + 1;
      Interface_Observercalculator'Elab_Spec;
      E154 := E154 + 1;
      Interface_Observerpressure'Elab_Spec;
      E174 := E174 + 1;
      Interface_Strategiefilter'Elab_Spec;
      E155 := E155 + 1;
      Filter_Airbus'Elab_Spec;
      Filter_Airbus'Elab_Body;
      E160 := E160 + 1;
      Filter_Boeing'Elab_Spec;
      Filter_Boeing'Elab_Body;
      E167 := E167 + 1;
      Filter_Dassault'Elab_Spec;
      Filter_Dassault'Elab_Body;
      E169 := E169 + 1;
      Interface_Strategievitesse'Elab_Spec;
      E156 := E156 + 1;
      Objetancetre'Elab_Spec;
      E175 := E175 + 1;
      Externaladm'Elab_Spec;
      Externaladm'Elab_Body;
      E173 := E173 + 1;
      Pressurecalculator'Elab_Spec;
      Pressurecalculator'Elab_Body;
      E158 := E158 + 1;
      ADM'ELAB_SPEC;
      ADM'ELAB_BODY;
      E124 := E124 + 1;
      Pressuresensor'Elab_Spec;
      Pressuresensor'Elab_Body;
      E177 := E177 + 1;
      Vitesse_Ecoulementcompressible'Elab_Spec;
      Vitesse_Ecoulementcompressible'Elab_Body;
      E181 := E181 + 1;
      Vitesse_Ecoulementincompressible'Elab_Spec;
      Vitesse_Ecoulementincompressible'Elab_Body;
      E190 := E190 + 1;
      Speedformulaselector'Elab_Spec;
      Speedformulaselector'Elab_Body;
      E179 := E179 + 1;
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
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\speedformulaselector.o
   --   C:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\main.o
   --   -LC:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\
   --   -LC:\Users\Bastien\Desktop\GitHub_bvstien\unesoiree\TP3\obj\
   --   -LC:/gnat/2018/lib/gcc/x86_64-pc-mingw32/7.3.1/adalib/
   --   -static
   --   -lgnat
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
