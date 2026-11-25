





























import Proving.USC.Common.Types
import Proving.USC.T18.Wave.Elements.Statute
import Proving.USC.T18.Wave.Deontic.Statute

namespace Proving.USC.T18.WaveBridge

open Proving.USC.Common



axiom mapEnt : Entity → Proving.USC.T18.Wave.Deontic.Enterprise









namespace A




axiom corr_addressee {p e inc i acts c} :
    Proving.USC.T18.Wave.Elements.Section1962a p e inc i acts c →
    Proving.USC.T18.Wave.Deontic.AddresseeInClass1962a p c



axiom corr_commerce {e c} :
    Proving.USC.Common.EngagedInInterstateCommerce e c →
    Proving.USC.T18.Wave.Deontic.EnterpriseAffectsCommerce (mapEnt e) c



axiom corr_regAct {p e inc i acts c} :
    Proving.USC.T18.Wave.Elements.Section1962a p e inc i acts c →
    Proving.USC.T18.Wave.Deontic.RegulatedActOccurred1962a p (mapEnt e) c





theorem s1962a_elements_implies_deontic_modulo_gaps
    {p e inc i acts c}
    (h : Proving.USC.T18.Wave.Elements.Section1962a p e inc i acts c)
    (gap_safeHarbor : Proving.USC.T18.Wave.Deontic.SecuritiesSafeHarbor1962a p (mapEnt e) c → False) :
    Proving.USC.T18.Wave.Deontic.ProhibitionViolated1962a p (mapEnt e) c :=
  ⟨⟨corr_addressee h, corr_commerce h.interstateCommerce⟩, corr_regAct h, gap_safeHarbor⟩

end A







namespace B

axiom corr_addressee {p e i acts c} :
    Proving.USC.T18.Wave.Elements.Section1962b p e i acts c →
    Proving.USC.T18.Wave.Deontic.AddresseeInClass1962b p c

axiom corr_commerce {e c} :
    Proving.USC.Common.EngagedInInterstateCommerce e c →
    Proving.USC.T18.Wave.Deontic.EnterpriseAffectsCommerce (mapEnt e) c



axiom corr_regAct {p e i acts c} :
    Proving.USC.T18.Wave.Elements.Section1962b p e i acts c →
    Proving.USC.T18.Wave.Deontic.RegulatedActOccurred1962b p (mapEnt e) c



theorem s1962b_elements_implies_deontic
    {p e i acts c}
    (h : Proving.USC.T18.Wave.Elements.Section1962b p e i acts c) :
    Proving.USC.T18.Wave.Deontic.ProhibitionViolated1962b p (mapEnt e) c :=
  ⟨⟨corr_addressee h, corr_commerce h.interstateCommerce⟩, corr_regAct h⟩

end B








namespace C



axiom corr_addressee {p e acts c} :
    Proving.USC.T18.Wave.Elements.Section1962c p e acts c →
    Proving.USC.T18.Wave.Deontic.AddresseeInClass1962c p (mapEnt e) c

axiom corr_commerce {e c} :
    Proving.USC.Common.EngagedInInterstateCommerce e c →
    Proving.USC.T18.Wave.Deontic.EnterpriseAffectsCommerce (mapEnt e) c



axiom corr_regAct {p e acts c} :
    Proving.USC.T18.Wave.Elements.Section1962c p e acts c →
    Proving.USC.T18.Wave.Deontic.RegulatedActOccurred1962c p (mapEnt e) c



theorem s1962c_elements_implies_deontic
    {p e acts c}
    (h : Proving.USC.T18.Wave.Elements.Section1962c p e acts c) :
    Proving.USC.T18.Wave.Deontic.ProhibitionViolated1962c p (mapEnt e) c :=
  ⟨⟨corr_addressee h, corr_commerce h.interstateCommerce⟩, corr_regAct h⟩

end C








namespace D


axiom corr_conspired {p ag obj c} :
    Proving.USC.T18.Wave.Elements.Section1962d p ag c obj →
    Proving.USC.T18.Wave.Deontic.ConspiredToViolate1962d p c



theorem s1962d_elements_implies_deontic
    {p ag obj c}
    (h : Proving.USC.T18.Wave.Elements.Section1962d p ag c obj) :
    Proving.USC.T18.Wave.Deontic.ProhibitionViolated1962d p c :=
  corr_conspired h

end D

end Proving.USC.T18.WaveBridge
