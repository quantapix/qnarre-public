








import Proving.USC.T42.ADA.Elements.Predicates

namespace Proving.USC.T42.ADA.Elements

open Proving.USC.Common




inductive HasDisability (p : Person) (c : ComplaintText) : Prop where
  | actual    (h : HasActualImpairmentLimitingMLA p c) : HasDisability p c
  | record    (h : HasRecordOfImpairment p c)          : HasDisability p c
  | regardedAs (h : IsRegardedAsImpaired p c)           : HasDisability p c





structure Section12112 (p : Person) (ce : CoveredEntity) (a : EmploymentAction)
    (c : ComplaintText) : Prop where
  disability   : HasDisability p c
  qualified    : IsQualifiedIndividualEmployment p c
  coveredEntity : IsCoveredEntity ce c
  adverseAction : AdverseEmploymentActionTaken a c
  causation    : ActionOnBasisOfDisability p a c
  notThreat    : ¬ PosesDirectThreat p c





structure Section12112FailureToAccommodate (p : Person) (ce : CoveredEntity)
    (c : ComplaintText) : Prop where
  disability    : HasDisability p c
  qualified     : IsQualifiedIndividualEmployment p c
  coveredEntity : IsCoveredEntity ce c
  failed        : FailedToReasonablyAccommodate ce p c
  notUndueHardship : ¬ AccommodationImposesUndueHardship ce c
  notThreat     : ¬ PosesDirectThreat p c


structure Section12132 (p : Person) (pe : PublicEntity) (s : PublicService)
    (c : ComplaintText) : Prop where
  publicEntity : IsPublicEntity pe c
  qualified    : IsQualifiedIndividualPublicService p c
  excluded     : ExcludedFromPublicService s c
  causation    : ExclusionByReasonOfDisability p s c
  notThreat    : ¬ PosesDirectThreat p c


structure Section12182 (p : Person) (pa : PublicAccommodation) (a : AccommodationAct)
    (c : ComplaintText) : Prop where
  disability    : HasDisability p c
  accommodation : OperatesPublicAccommodation pa c
  denied        : DeniedFullEqualEnjoyment a c
  causation     : DenialOnBasisOfDisability p a c
  notThreat     : ¬ PosesDirectThreat p c




structure Section12203 (p : Person) (c : ComplaintText) : Prop where
  protectedActivity : EngagedInProtectedActivityADA p c
  retaliatoryAct    : RetaliatoryActOccurredADA p c
  causation         : RetaliationCausalNexus p c



inductive ValidADAClaim (p : Person) (c : ComplaintText) : Prop where
  | titleI {ce a} (h : Section12112 p ce a c) : ValidADAClaim p c
  | titleIAccommodate {ce} (h : Section12112FailureToAccommodate p ce c) : ValidADAClaim p c
  | titleII {pe s} (h : Section12132 p pe s c) : ValidADAClaim p c
  | titleIII {pa a} (h : Section12182 p pa a c) : ValidADAClaim p c
  | retaliation (h : Section12203 p c) : ValidADAClaim p c

end Proving.USC.T42.ADA.Elements
