version 1.0


import "../tasks/task_seqsero2_PE_Kmode.wdl" as taxon
import "../tasks/task_versioning.wdl" as versioning

workflow seqsero2_assembly_wf {
  input {
      File reads_1
      File reads_2
      String samplename
    }
  call taxon.seqsero2_PE_one_sample {
    input:
      reads_1 = reads_1,
      reads_2 = reads_2,
      samplename = samplename
    }
  call versioning.version_capture{
    input:
  }
  output {
    String seqsero2_wf_version = version_capture.phbg_version
    String seqsero2_wf_analysis_date = version_capture.date
    
    File seqsero2_report = seqsero2_PE_one_sample.seqsero2_output_file
    String seqsero2_version = seqsero2_PE_one_sample.version
    String seqsero2_predicted_ID = seqsero2_PE_one_sample.predicted_identification
    String seqsero2_antigenic_profile = seqsero2_PE_one_sample.predicted_antigenic_profile
    String seqsero2_serotype = seqsero2_PE_one_sample.predicted_serotype
    String seqsero2_o_antigen = seqsero2_PE_one_sample.o_antigen_prediction
    String seqsero2_h1_antigen = seqsero2_PE_one_sample.h1_antigen_prediction
    String seqsero2_h2_antigen = seqsero2_PE_one_sample.h2_antigen_prediction
    String seqsero2_contamination = seqsero2_PE_one_sample.contamination
    String seqsero2_note = seqsero2_PE_one_sample.notes
    }
 }
