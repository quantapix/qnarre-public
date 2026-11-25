










import Proving.USC.T29.LMRA.Elements.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T29.LMRA.Elements

open Proving.USC.Common





structure Section185 (p : Person) (e : Entity) (k : LaborContract) (c : ComplaintText) : Prop where
  party              : IsPartyToLaborContract p k c
  coveredContract    : IsSection301Contract k c
  industryCommerce   : EngagedInInterstateCommerce e c
  breach             : ContractViolated k c





structure Section178 (w : WorkStoppage) (c : ComplaintText) : Prop where
  affectsIndustry    : AffectsEntireIndustry w c
  imperils           : ImperilsNationalHealthOrSafety w c
  procedure          : BoardOfInquiryReportAndPetition c





structure Section186 (p : Person) (pay : Payment) (c : ComplaintText) : Prop where
  prohibited         : IsProhibitedPayment pay c
  covered            : CoveredPayerAndPayee pay c
  noException        : NotWithinSection186cException pay c
  scienter           : ActedWithScienter p c





structure Section187 (p : Person) (lo : Entity) (c : ComplaintText) : Prop where
  unlawfulConduct    : EngagedInSection158b4Conduct p c
  industryCommerce   : EngagedInInterstateCommerce lo c
  injury             : InjuredInBusinessOrProperty p c
  causation          : ProximateCause p c
  timely             : WithinLimitations p c




inductive ValidLMRAClaim (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  | contract  (k : LaborContract) (h : Section185 p e k c) : ValidLMRAClaim p e c
  | financial (pay : Payment)     (h : Section186 p pay c) : ValidLMRAClaim p e c
  | boycott   (h : Section187 p e c)                       : ValidLMRAClaim p e c

end Proving.USC.T29.LMRA.Elements
