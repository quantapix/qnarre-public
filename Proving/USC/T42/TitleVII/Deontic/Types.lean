import Proving.USC.Common.Types

















namespace Proving.USC.T42.TitleVII.Deontic

open Proving.USC.Common


inductive Modality
  | obligation
  | prohibition
  | permission
  | power
  deriving DecidableEq, Repr






abbrev LegalPerson := Person



abbrev TitleVIISubject := LegalPerson



abbrev Individual := LegalPerson

end Proving.USC.T42.TitleVII.Deontic
