













import Proving.USC.T08.Inadmissibility.Procedure.Types
import Proving.USC.T08.Inadmissibility.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T08.Inadmissibility.Procedure

open Proving.USC.Common





structure Transition (σ : Type) where
  pre   : σ
  post  : σ
  guard : Prop




def ThreeYearTrigger (a : Alien) (c : ComplaintText) : Prop :=
  180 < UnlawfulPresenceDays a c ∧ UnlawfulPresenceDays a c < year


def TenYearTrigger (a : Alien) (c : ComplaintText) : Prop :=
  year ≤ UnlawfulPresenceDays a c



def WithinThreeYearWindow (a : Alien) (c : ComplaintText) : Prop :=
  SeeksAdmissionDay a c - DepartureDay a c < 3 * year


def WithinTenYearWindow (a : Alien) (c : ComplaintText) : Prop :=
  SeeksAdmissionDay a c - DepartureDay a c < 10 * year





structure ThreeYearBar (a : Alien) (c : ComplaintText) : Prop where
  trigger   : ThreeYearTrigger a c
  departed  : Departed a c
  seeks     : SeeksReadmission a c
  inWindow  : WithinThreeYearWindow a c
  noConsent : ¬ ConsentToReapply a c



structure TenYearBar (a : Alien) (c : ComplaintText) : Prop where
  trigger   : TenYearTrigger a c
  departed  : Departed a c
  seeks     : SeeksReadmission a c
  inWindow  : WithinTenYearWindow a c
  noConsent : ¬ ConsentToReapply a c



inductive ReentryBarApplies (a : Alien) (c : ComplaintText) : Prop
  | three : ThreeYearBar a c → ReentryBarApplies a c
  | ten   : TenYearBar a c → ReentryBarApplies a c





def WithinPetitionWindow (e : Entity) (c : ComplaintText) : Prop :=
  PetitionFilingDay e c - FinalOrderDay e c ≤ 45




structure TimelyPetitionForReview (e : Entity) (c : ComplaintText) : Prop where
  afforded   : NoticeAndHearingAfforded e c
  finalOrder : FinalOrderIssued e c
  petitioned : PetitionFiled e c
  inWindow   : WithinPetitionWindow e c

end Proving.USC.T08.Inadmissibility.Procedure
