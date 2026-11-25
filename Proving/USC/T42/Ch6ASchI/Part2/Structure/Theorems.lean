import Proving.USC.T42.Ch6ASchI.Part2.Structure.Statute
import Proving.USC.Common.Types



namespace Proving.USC.T42.Ch6ASchI.Part2.Structure
open Proving.USC.Common

theorem coherent211_intro {c : ComplaintText}
    (payBase1406 : ReferencedSectionExists edge_211_incorporates_t10_1406 c)
    (payBase1407 : ReferencedSectionExists edge_211_incorporates_t10_1407 c)
    (payMult1409 : ReferencedSectionExists edge_211_incorporates_t10_1409 c)
    (strengthCap : ReferencedSectionExists edge_211_incorporates_210b c)
    (oathWaiver  : IncorporationHonored edge_211_incorporates_t5_3332 c)
    : Coherent211 c :=
  ⟨payBase1406, payBase1407, payMult1409, strengthCap, oathWaiver⟩

theorem coherent211c_intro {c : ComplaintText}
    (noDoubleCredit : ExceptionApplies edge_211c_exceptAsProvided_otherLaw c)
    : Coherent211c c :=
  ⟨noDoubleCredit⟩

theorem coherent212_intro {c : ComplaintText}
    (payBase1406    : ReferencedSectionExists edge_212_incorporates_t10_1406 c)
    (payBase1407    : ReferencedSectionExists edge_212_incorporates_t10_1407 c)
    (payMult1409    : ReferencedSectionExists edge_212_incorporates_t10_1409 c)
    (basicPay205    : IncorporationHonored edge_212_incorporates_t37_205 c)
    (s211Formula    : IncorporationHonored edge_212_incorporates_211 c)
    (s213aRecall    : ReferencedSectionExists edge_212_incorporates_213a c)
    (disability1208 : ReferencedSectionExists edge_212_incorporates_t10_1208 c)
    (paraSixCarve   : ExceptionApplies edge_212_exceptAsProvided_212a6 c)
    : Coherent212 c :=
  ⟨payBase1406, payBase1407, payMult1409, basicPay205, s211Formula, s213aRecall,
   disability1208, paraSixCarve⟩

theorem coherent213_intro {c : ComplaintText}
    (s417Benefit    : ReferencedSectionExists edge_213_incorporates_417 c)
    (scra3901       : ReferencedSectionExists edge_213_incorporates_t50_3901 c)
    (subsecBCarve   : ExceptionApplies edge_213_exceptAsProvided_b c)
    (indemnityCarve : ExceptionApplies edge_213_savings_serviceIndemnity c)
    : Coherent213 c :=
  ⟨s417Benefit, scra3901, subsecBCarve, indemnityCarve⟩

theorem coherent213a_intro {c : ComplaintText}
    (escort1036       : ReferencedSectionExists edge_213a_incorporates_t10_1036 c)
    (disabilityCh61   : IncorporationHonored edge_213a_incorporates_t10_ch61 c)
    (nonRegularPay    : IncorporationHonored edge_213a_incorporates_t10_ch1223 c)
    (claimsCondition  : ReferencedSectionExists edge_213a_subjectTo_213 c)
    (whistleblower1034 : ReferencedSectionExists edge_213a_incorporates_t10_1034 c)
    : Coherent213a c :=
  ⟨escort1036, disabilityCh61, nonRegularPay, claimsCondition, whistleblower1034⟩

theorem coherent214_intro {c : ComplaintText}
    (priorFlagBar : ExceptionApplies edge_214_savings_otherLaw c)
    : Coherent214 c :=
  ⟨priorFlagBar⟩

theorem coherent215_intro {c : ComplaintText}
    (benefits213      : IncorporationHonored edge_215_incorporates_213 c)
    (emergencyDef204a : ReferencedSectionExists edge_215_incorporates_204a c)
    : Coherent215 c :=
  ⟨benefits213, emergencyDef204a⟩

theorem coherent217_intro {c : ComplaintText}
    (ucmjApplies : ReferencedSectionExists edge_217_subjectTo_ucmj c)
    : Coherent217 c :=
  ⟨ucmjApplies⟩

theorem coherent217a_intro {c : ComplaintText}
    (overrideCh51 : OverrideTriggered edge_217a_notwithstanding_t5_ch51 c)
    (overrideCh53 : OverrideTriggered edge_217a_notwithstanding_t5_ch53 c)
    (compRate210c : IncorporationHonored edge_217a_incorporates_210c c)
    : Coherent217a c :=
  ⟨overrideCh51, overrideCh53, compRate210c⟩

theorem coherent217a1_intro {c : ComplaintText}
    (phsAct     : ReferencedSectionExists edge_217a1_incorporates_phsa c)
    (alcoholAct : ReferencedSectionExists edge_217a1_incorporates_4541 c)
    : Coherent217a1 c :=
  ⟨phsAct, alcoholAct⟩

end Proving.USC.T42.Ch6ASchI.Part2.Structure
