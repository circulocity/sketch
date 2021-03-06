;;;; controllers.lisp

(in-package #:sketch)

;;;   ____ ___  _   _ _____ ____   ___  _     _     _____ ____  ____
;;;  / ___/ _ \| \ | |_   _|  _ \ / _ \| |   | |   | ____|  _ \/ ___|
;;; | |  | | | |  \| | | | | |_) | | | | |   | |   |  _| | |_) \___ \
;;; | |__| |_| | |\  | | | |  _ <| |_| | |___| |___| |___|  _ < ___) |
;;;  \____\___/|_| \_| |_| |_| \_\\___/|_____|_____|_____|_| \_\____/

;;; Mouse

(defmethod kit.sdl2:mousemotion-event :after ((sketch-window sketch)
					      timestamp button-mask x y xrel yrel)
  (out :mouse (cons x y)
       :mouse-x x
       :mouse-y y
       :mouse-rel (cons xrel yrel)
       :mouse-xrel xrel
       :mouse-yrel yrel))

(defmethod kit.sdl2:mousewheel-event :after ((sketch-window sketch)
					     timestamp x y)
  (out :mouse-wheel (cons x y)
       :mouse-wheel-x x
       :mouse-wheel-y y))

(defmethod kit.sdl2:mousebutton-event :after ((sketch-window sketch)
					      state timestamp button x y)
  (when (eq state :mousebuttondown)
    (out :controller-mouse-click t)))

;;; Keyboard

(defmethod keyboard-event :after ((sketch-window sketch)
				  state timestamp repeatp keysym)
  (when repeatp
    (print "repeat!")
    (finish-output)))

;; (defmacro defcontroller (name &body forms)
;;   )

;; (defcontroller default
;;   (:click ))

;; (use-controller )

;; (deflink )
