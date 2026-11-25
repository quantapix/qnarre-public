









import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T08.Inadmissibility.Elements.Types
import Proving.USC.T08.Inadmissibility.Elements.Predicates

namespace Proving.USC.T08.Inadmissibility.Elements

open Proving.USC.Common





inductive InadmissibilityGround (al : Alien) (c : ComplaintText) : Prop where
  | health      (h : HealthRelatedGround al c)
  | criminal    (h : CriminalGround al c)
  | security    (h : SecurityOrTerrorismGround al c)
  | publicCharge (h : PublicChargeGround al c)
  | labor       (h : LaborCertificationGround al c)
  | illegalEntry (h : IllegalEntrantOrViolatorGround al c)
  | documentation (h : DocumentationGround al c)
  | citizenship (h : IneligibleForCitizenshipGround al c)
  | priorRemoval (h : PreviouslyRemovedGround al c)
  | misc        (h : MiscellaneousInadmissibilityGround al c)





structure Section1182a (al : Alien) (c : ComplaintText) : Prop where
  alien    : IsAlien al c
  seeks    : SeeksVisaOrAdmission al c
  ground   : InadmissibilityGround al c
  noWaiver : ¬ ApplicableWaiverGranted al c





structure KnowingHire1324a (p : Person) (al : Alien) (c : ComplaintText) : Prop where
  coverage     : IsPersonOrEntity p c
  act          : HiredRecruitedOrReferred p al c
  inUS         : ForEmploymentInUS p al c
  unauthorized : IsUnauthorizedAlien al c
  knowing      : ActedWithScienter p c
  noDefense    : ¬ GoodFaithVerificationDefense p c




structure PaperworkViolation1324a (p : Person) (al : Alien) (c : ComplaintText) : Prop where
  coverage  : IsPersonOrEntity p c
  hire      : HiredForEmployment p al c
  noComply  : FailedToComplyWithVerification p c



structure ContinuingEmployment1324a (p : Person) (al : Alien) (c : ComplaintText) : Prop where
  coverage     : IsPersonOrEntity p c
  continued    : ContinuedToEmploy p al c
  unauthorized : BecameUnauthorizedAlien al c
  knowing      : ActedWithScienter p c



structure IndemnityViolation1324a (p : Person) (al : Alien) (c : ComplaintText) : Prop where
  coverage : IsPersonOrEntity p c
  bond     : RequiredIndemnityBond p al c



inductive ValidSection1324aViolation (p : Person) (al : Alien) (c : ComplaintText) : Prop where
  | knowingHire (h : KnowingHire1324a p al c)
  | paperwork   (h : PaperworkViolation1324a p al c)
  | continuing  (h : ContinuingEmployment1324a p al c)
  | indemnity   (h : IndemnityViolation1324a p al c)

end Proving.USC.T08.Inadmissibility.Elements
