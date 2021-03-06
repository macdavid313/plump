#|
 This file is a part of Plump
 (c) 2014 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:org.shirakumo.plump.dom)

;; According to http://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references
(defparameter *entity-map*
  (loop with table = (make-hash-table :test 'equal)
        for (key . val) in '(("quot" . #\")
                             ("amp" . #\&)
                             ("apos" . #\')
                             ("lt" . #\<)
                             ("gt" . #\>)
                             ("nbsp" . #\ )
                             #+:asdf-unicode ("iexcl" . #\¡)
                             #+:asdf-unicode ("cent" . #\¢)
                             #+:asdf-unicode ("pound" . #\£)
                             #+:asdf-unicode ("curren" . #\¤)
                             #+:asdf-unicode ("yen" . #\¥)
                             #+:asdf-unicode ("brvbar" . #\¦)
                             #+:asdf-unicode ("sect" . #\§)
                             #+:asdf-unicode ("uml" . #\¨)
                             #+:asdf-unicode ("copy" . #\©)
                             #+:asdf-unicode ("ordf" . #\ª)
                             #+:asdf-unicode ("laquo" . #\«)
                             #+:asdf-unicode ("not" . #\¬)
                             #+:asdf-unicode ("shy" . #\ )
                             #+:asdf-unicode ("reg" . #\®)
                             #+:asdf-unicode ("macr" . #\¯)
                             #+:asdf-unicode ("deg" . #\°)
                             #+:asdf-unicode ("plusmn" . #\±)
                             #+:asdf-unicode ("sup2" . #\²)
                             #+:asdf-unicode ("sup3" . #\³)
                             #+:asdf-unicode ("acute" . #\´)
                             #+:asdf-unicode ("micro" . #\µ)
                             #+:asdf-unicode ("para" . #\¶)
                             #+:asdf-unicode ("middot" . #\·)
                             #+:asdf-unicode ("cedil" . #\¸)
                             #+:asdf-unicode ("sup1" . #\¹)
                             #+:asdf-unicode ("ordm" . #\º)
                             #+:asdf-unicode ("raquo" . #\»)
                             #+:asdf-unicode ("frac14" . #\¼)
                             #+:asdf-unicode ("frac12" . #\½)
                             #+:asdf-unicode ("frac34" . #\¾)
                             #+:asdf-unicode ("iquest" . #\¿)
                             #+:asdf-unicode ("Agrave" . #\À)
                             #+:asdf-unicode ("Aacute" . #\Á)
                             #+:asdf-unicode ("Acirc" . #\Â)
                             #+:asdf-unicode ("Atilde" . #\Ã)
                             #+:asdf-unicode ("Auml" . #\Ä)
                             #+:asdf-unicode ("Aring" . #\Å)
                             #+:asdf-unicode ("AElig" . #\Æ)
                             #+:asdf-unicode ("Ccedil" . #\Ç)
                             #+:asdf-unicode ("Egrave" . #\È)
                             #+:asdf-unicode ("Eacute" . #\É)
                             #+:asdf-unicode ("Ecirc" . #\Ê)
                             #+:asdf-unicode ("Euml" . #\Ë)
                             #+:asdf-unicode ("Igrave" . #\Ì)
                             #+:asdf-unicode ("Iacute" . #\Í)
                             #+:asdf-unicode ("Icirc" . #\Î)
                             #+:asdf-unicode ("Iuml" . #\Ï)
                             #+:asdf-unicode ("ETH" . #\Ð)
                             #+:asdf-unicode ("Ntilde" . #\Ñ)
                             #+:asdf-unicode ("Ograve" . #\Ò)
                             #+:asdf-unicode ("Oacute" . #\Ó)
                             #+:asdf-unicode ("Ocirc" . #\Ô)
                             #+:asdf-unicode ("Otilde" . #\Õ)
                             #+:asdf-unicode ("Ouml" . #\Ö)
                             #+:asdf-unicode ("times" . #\×)
                             #+:asdf-unicode ("Oslash" . #\Ø)
                             #+:asdf-unicode ("Ugrave" . #\Ù)
                             #+:asdf-unicode ("Uacute" . #\Ú)
                             #+:asdf-unicode ("Ucirc" . #\Û)
                             #+:asdf-unicode ("Uuml" . #\Ü)
                             #+:asdf-unicode ("Yacute" . #\Ý)
                             #+:asdf-unicode ("THORN" . #\Þ)
                             #+:asdf-unicode ("szlig" . #\ß)
                             #+:asdf-unicode ("agrave" . #\à)
                             #+:asdf-unicode ("aacute" . #\á)
                             #+:asdf-unicode ("acirc" . #\â)
                             #+:asdf-unicode ("atilde" . #\ã)
                             #+:asdf-unicode ("auml" . #\ä)
                             #+:asdf-unicode ("aring" . #\å)
                             #+:asdf-unicode ("aelig" . #\æ)
                             #+:asdf-unicode ("ccedil" . #\ç)
                             #+:asdf-unicode ("egrave" . #\è)
                             #+:asdf-unicode ("eacute" . #\é)
                             #+:asdf-unicode ("ecirc" . #\ê)
                             #+:asdf-unicode ("euml" . #\ë)
                             #+:asdf-unicode ("igrave" . #\ì)
                             #+:asdf-unicode ("iacute" . #\í)
                             #+:asdf-unicode ("icirc" . #\î)
                             #+:asdf-unicode ("iuml" . #\ï)
                             #+:asdf-unicode ("eth" . #\ð)
                             #+:asdf-unicode ("ntilde" . #\ñ)
                             #+:asdf-unicode ("ograve" . #\ò)
                             #+:asdf-unicode ("oacute" . #\ó)
                             #+:asdf-unicode ("ocirc" . #\ô)
                             #+:asdf-unicode ("otilde" . #\õ)
                             #+:asdf-unicode ("ouml" . #\ö)
                             #+:asdf-unicode ("divide" . #\÷)
                             #+:asdf-unicode ("oslash" . #\ø)
                             #+:asdf-unicode ("ugrave" . #\ù)
                             #+:asdf-unicode ("uacute" . #\ú)
                             #+:asdf-unicode ("ucirc" . #\û)
                             #+:asdf-unicode ("uuml" . #\ü)
                             #+:asdf-unicode ("yacute" . #\ý)
                             #+:asdf-unicode ("thorn" . #\þ)
                             #+:asdf-unicode ("yuml" . #\ÿ)
                             #+:asdf-unicode ("OElig" . #\Œ)
                             #+:asdf-unicode ("oelig" . #\œ)
                             #+:asdf-unicode ("Scaron" . #\Š)
                             #+:asdf-unicode ("scaron" . #\š)
                             #+:asdf-unicode ("Yuml" . #\Ÿ)
                             #+:asdf-unicode ("fnof" . #\ƒ)
                             #+:asdf-unicode ("circ" . #\ˆ)
                             #+:asdf-unicode ("tilde" . #\˜)
                             #+:asdf-unicode ("Alpha" . #\Α)
                             #+:asdf-unicode ("Beta" . #\Β)
                             #+:asdf-unicode ("Gamma" . #\Γ)
                             #+:asdf-unicode ("Delta" . #\Δ)
                             #+:asdf-unicode ("Epsilon" . #\Ε)
                             #+:asdf-unicode ("Zeta" . #\Ζ)
                             #+:asdf-unicode ("Eta" . #\Η)
                             #+:asdf-unicode ("Theta" . #\Θ)
                             #+:asdf-unicode ("Iota" . #\Ι)
                             #+:asdf-unicode ("Kappa" . #\Κ)
                             #+:asdf-unicode ("Lambda" . #\Λ)
                             #+:asdf-unicode ("Mu" . #\Μ)
                             #+:asdf-unicode ("Nu" . #\Ν)
                             #+:asdf-unicode ("Xi" . #\Ξ)
                             #+:asdf-unicode ("Omicron" . #\Ο)
                             #+:asdf-unicode ("Pi" . #\Π)
                             #+:asdf-unicode ("Rho" . #\Ρ)
                             #+:asdf-unicode ("Sigma" . #\Σ)
                             #+:asdf-unicode ("Tau" . #\Τ)
                             #+:asdf-unicode ("Upsilon" . #\Υ)
                             #+:asdf-unicode ("Phi" . #\Φ)
                             #+:asdf-unicode ("Chi" . #\Χ)
                             #+:asdf-unicode ("Psi" . #\Ψ)
                             #+:asdf-unicode ("Omega" . #\Ω)
                             #+:asdf-unicode ("alpha" . #\α)
                             #+:asdf-unicode ("beta" . #\β)
                             #+:asdf-unicode ("gamma" . #\γ)
                             #+:asdf-unicode ("delta" . #\δ)
                             #+:asdf-unicode ("epsilon" . #\ε)
                             #+:asdf-unicode ("zeta" . #\ζ)
                             #+:asdf-unicode ("eta" . #\η)
                             #+:asdf-unicode ("theta" . #\θ)
                             #+:asdf-unicode ("iota" . #\ι)
                             #+:asdf-unicode ("kappa" . #\κ)
                             #+:asdf-unicode ("lambda" . #\λ)
                             #+:asdf-unicode ("mu" . #\μ)
                             #+:asdf-unicode ("nu" . #\ν)
                             #+:asdf-unicode ("xi" . #\ξ)
                             #+:asdf-unicode ("omicron" . #\ο)
                             #+:asdf-unicode ("pi" . #\π)
                             #+:asdf-unicode ("rho" . #\ρ)
                             #+:asdf-unicode ("sigmaf" . #\ς)
                             #+:asdf-unicode ("sigma" . #\σ)
                             #+:asdf-unicode ("tau" . #\τ)
                             #+:asdf-unicode ("upsilon" . #\υ)
                             #+:asdf-unicode ("phi" . #\φ)
                             #+:asdf-unicode ("chi" . #\χ)
                             #+:asdf-unicode ("psi" . #\ψ)
                             #+:asdf-unicode ("omega" . #\ω)
                             #+:asdf-unicode ("thetasym" . #\ϑ)
                             #+:asdf-unicode ("upsih" . #\ϒ)
                             #+:asdf-unicode ("piv" . #\ϖ)
                             #+:asdf-unicode ("ensp" . #\ )
                             #+:asdf-unicode ("emsp" . #\ )
                             #+:asdf-unicode ("thinsp" . #\ )
                             #+:asdf-unicode ("zwnj" . #\ )
                             #+:asdf-unicode ("zwj" . #\ )
                             #+:asdf-unicode ("lrm" . #\ )
                             #+:asdf-unicode ("rlm" . #\ )
                             #+:asdf-unicode ("ndash" . #\–)
                             #+:asdf-unicode ("mdash" . #\—)
                             #+:asdf-unicode ("lsquo" . #\‘)
                             #+:asdf-unicode ("rsquo" . #\’)
                             #+:asdf-unicode ("sbquo" . #\‚)
                             #+:asdf-unicode ("ldquo" . #\“)
                             #+:asdf-unicode ("rdquo" . #\”)
                             #+:asdf-unicode ("bdquo" . #\„)
                             #+:asdf-unicode ("dagger" . #\†)
                             #+:asdf-unicode ("Dagger" . #\‡)
                             #+:asdf-unicode ("bull" . #\•)
                             #+:asdf-unicode ("hellip" . #\…)
                             #+:asdf-unicode ("permil" . #\‰)
                             #+:asdf-unicode ("prime" . #\′)
                             #+:asdf-unicode ("Prime" . #\″)
                             #+:asdf-unicode ("lsaquo" . #\‹)
                             #+:asdf-unicode ("rsaquo" . #\›)
                             #+:asdf-unicode ("oline" . #\‾)
                             #+:asdf-unicode ("frasl" . #\⁄)
                             #+:asdf-unicode ("euro" . #\€)
                             #+:asdf-unicode ("image" . #\ℑ)
                             #+:asdf-unicode ("weierp" . #\℘)
                             #+:asdf-unicode ("real" . #\ℜ)
                             #+:asdf-unicode ("trade" . #\™)
                             #+:asdf-unicode ("alefsym" . #\ℵ)
                             #+:asdf-unicode ("larr" . #\←)
                             #+:asdf-unicode ("uarr" . #\↑)
                             #+:asdf-unicode ("rarr" . #\→)
                             #+:asdf-unicode ("darr" . #\↓)
                             #+:asdf-unicode ("harr" . #\↔)
                             #+:asdf-unicode ("crarr" . #\↵)
                             #+:asdf-unicode ("lArr" . #\⇐)
                             #+:asdf-unicode ("uArr" . #\⇑)
                             #+:asdf-unicode ("rArr" . #\⇒)
                             #+:asdf-unicode ("dArr" . #\⇓)
                             #+:asdf-unicode ("hArr" . #\⇔)
                             #+:asdf-unicode ("forall" . #\∀)
                             #+:asdf-unicode ("part" . #\∂)
                             #+:asdf-unicode ("exist" . #\∃)
                             #+:asdf-unicode ("empty" . #\∅)
                             #+:asdf-unicode ("nabla" . #\∇)
                             #+:asdf-unicode ("isin" . #\∈)
                             #+:asdf-unicode ("notin" . #\∉)
                             #+:asdf-unicode ("ni" . #\∋)
                             #+:asdf-unicode ("prod" . #\∏)
                             #+:asdf-unicode ("sum" . #\∑)
                             #+:asdf-unicode ("minus" . #\−)
                             #+:asdf-unicode ("lowast" . #\∗)
                             #+:asdf-unicode ("radic" . #\√)
                             #+:asdf-unicode ("prop" . #\∝)
                             #+:asdf-unicode ("infin" . #\∞)
                             #+:asdf-unicode ("ang" . #\∠)
                             #+:asdf-unicode ("and" . #\∧)
                             #+:asdf-unicode ("or" . #\∨)
                             #+:asdf-unicode ("cap" . #\∩)
                             #+:asdf-unicode ("cup" . #\∪)
                             #+:asdf-unicode ("int" . #\∫)
                             #+:asdf-unicode ("there4" . #\∴)
                             #+:asdf-unicode ("sim" . #\∼)
                             #+:asdf-unicode ("cong" . #\≅)
                             #+:asdf-unicode ("asymp" . #\≈)
                             #+:asdf-unicode ("ne" . #\≠)
                             #+:asdf-unicode ("equiv" . #\≡)
                             #+:asdf-unicode ("le" . #\≤)
                             #+:asdf-unicode ("ge" . #\≥)
                             #+:asdf-unicode ("sub" . #\⊂)
                             #+:asdf-unicode ("sup" . #\⊃)
                             #+:asdf-unicode ("nsub" . #\⊄)
                             #+:asdf-unicode ("sube" . #\⊆)
                             #+:asdf-unicode ("supe" . #\⊇)
                             #+:asdf-unicode ("oplus" . #\⊕)
                             #+:asdf-unicode ("otimes" . #\⊗)
                             #+:asdf-unicode ("perp" . #\⊥)
                             #+:asdf-unicode ("sdot" . #\⋅)
                             #+:asdf-unicode ("vellip" . #\⋮)
                             #+:asdf-unicode ("lceil" . #\⌈)
                             #+:asdf-unicode ("rceil" . #\⌉)
                             #+:asdf-unicode ("lfloor" . #\⌊)
                             #+:asdf-unicode ("rfloor" . #\⌋)
                             #+:asdf-unicode ("lang" . #\〈)
                             #+:asdf-unicode ("rang" . #\〉)
                             #+:asdf-unicode ("loz" . #\◊)
                             #+:asdf-unicode ("spades" . #\♠)
                             #+:asdf-unicode ("clubs" . #\♣)
                             #+:asdf-unicode ("hearts" . #\♥)
                             #+:asdf-unicode ("diams" . #\♦))
        do (setf (gethash key table) val)
        finally (return table))
  "String hash-table containing the entity names and mapping them to their respective characters.")
(declaim (type hash-table *entity-map*))

(defun translate-entity (text &key (start 0) (end (length text)))
  "Translates the given entity identifier (a name, #Dec or #xHex) into their respective strings if possible.
Otherwise returns NIL."
  (declare (optimize (speed 3)))
  (declare (type simple-string text)
           (type fixnum start end))
  (if (char= (elt text start) #\#)
      (when (<= 2 (- end start))
        (code-char
         (if (char= (elt text (+ start 1)) #\x)
             (parse-integer text :start (+ start 2) :end end :radix 16)
             (parse-integer text :start (+ start 1) :end end))))
      (gethash (subseq text start end) *entity-map*)))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defparameter *alpha-chars* (coerce "0123456789#abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" 'list))
  (declaim (type list *alpha-chars*)))

(defun decode-entities (text &optional remove-invalid)
  "Translates all entities in the text into their character counterparts if possible.
If an entity does not match, it is left in place unless REMOVE-INVALID is non-NIL."
  (declare (optimize (speed 3))
           (type simple-string text)
           (type boolean remove-invalid))
  (with-output-to-string (output)
    (loop with start = 0
          for i from 0 below (length text)
          do (when (char= (aref text i) #\&)
               (write-string text output :start start :end i)
               (setf start i)
               (loop for i from (1+ i) below (length text)
                     do (case (aref text i)
                          (#.*alpha-chars*
                           T)
                          (#\;
                           (let ((entity (translate-entity text :start (+ start 1) :end i)))
                             (cond
                               (entity (write-char entity output))
                               (remove-invalid NIL)
                               (T (write-string text output :start start :end (1+ i)))))
                           (setf start (1+ i) i (1+ i))
                           (return))
                          (T ; Invalid char, not an entity.
                           (return)))))
          finally (write-string text output :start start))))

(defun encode-entities (text)
  "Encodes the characters < > & \" with their XML entity equivalents."
  (declare (optimize (speed 3))
           (type simple-string text))
  (with-output-to-string (output)
    (loop for c across text
          do (case c
               (#\< (write-string "&lt;" output))
               (#\> (write-string "&gt;" output))
               (#\" (write-string "&quot;" output))
               (#\& (write-string "&amp;" output))
               (t (write-char c output))))))
