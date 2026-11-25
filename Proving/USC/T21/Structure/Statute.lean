import Proving.USC.T21.Structure.Types
import Proving.USC.T21.Structure.Predicates
import Proving.USC.Common.Types







namespace Proving.USC.T21.Structure

open Proving.USC.Common (ComplaintText)





structure Coherent802 (c : ComplaintText) : Prop where
  drugDef        : IncorporationHonored edge_802_12_incorporates_321g1 c
  hempCarveOut   : IncorporationHonored edge_802_16_incorporates_7_1639o c
  seriousFelony  : IncorporationHonored edge_802_58_incorporates_18_924e2 c
  fentanylReldef : IncorporationHonored edge_802_60_incorporates_812c c
  ircExclusion   : ReferencedSectionExists edge_802_6_incorporates_irc_subtitleE c






structure Coherent841 (c : ComplaintText) : Prop where
  controlledSubstanceDef : IncorporationHonored edge_841a_incorporates_802_6 c
  counterfeitDef         : IncorporationHonored edge_841a_incorporates_802_7 c
  operativeVerbDefs      : IncorporationHonored edge_841a_incorporates_802_verbs c
  felonyDrugOffenseDef   : IncorporationHonored edge_841b_incorporates_802_44 c
  authorizationTarget    : ReferencedSectionExists edge_841a_exceptAs_subchapterAuth c
  exception849           : ReferencedSectionExists edge_841b_exceptAs_849 c
  exception859           : ReferencedSectionExists edge_841b_exceptAs_859 c
  exception860           : ReferencedSectionExists edge_841b_exceptAs_860 c
  exception861           : ReferencedSectionExists edge_841b_exceptAs_861 c
  titleFines             : IncorporationHonored edge_841b_incorporates_t18_fines c
  crimeOfViolenceDef     : IncorporationHonored edge_841b7_incorporates_18_16 c
  recordkeeping830       : IncorporationHonored edge_841cf_incorporates_830 c
  supervisedReleaseOverrideTarget : ReferencedSectionExists edge_841b1C_notwithstanding_18_3583 c
  smallMarihuanaRedirect844       : ReferencedSectionExists edge_841b4_incorporates_844 c
  smallMarihuanaRedirect3607      : ReferencedSectionExists edge_841b4_incorporates_18_3607 c




structure Coherent846 (c : ComplaintText) : Prop where
  objectOffenseDefined : IncorporationHonored edge_846_incorporates_offenses c
  penaltiesResolve     : IncorporationHonored edge_846_incorporates_penalties c






inductive SentencingPath841 (c : ComplaintText) : Prop where
  | standard
      (defaultGoverns : ReferencedSectionExists edge_841b_exceptAs_849 c)
      (noRedirect     : ReferencedSectionExists edge_841b4_notwithstanding_841b1D c)
  | redirected
      (overrideFires  : OverrideTriggered edge_841b4_notwithstanding_841b1D c)
      (via844         : IncorporationHonored edge_841b4_incorporates_844 c)
      (via3607        : IncorporationHonored edge_841b4_incorporates_18_3607 c)

end Proving.USC.T21.Structure
