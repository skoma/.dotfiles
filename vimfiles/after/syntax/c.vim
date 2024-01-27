syn keyword	cStorageClass	internal fun function global
syn keyword	cType		u8 s8 u16 s16 u32 s32 u64 s64 f32 f64 mem smem
syn keyword	cType		Buffer String
"syn keyword	cType		QString QStringList QVector QMap QSet QHash QList QByteArray QTimer QWidget QScrollBar QLabel QComboBox QCheckBox QFrame QGraphicsView QGraphicsScene QGraphicsWidget QModelIndex QColor QPalette QPair QPainter QPainterPath QHBoxLayout QVBoxLayout QLayout QPoint QPointF QRect QRectF QPolygon QPolygonF QSize QSizeF QFont QFontMetrics QFontMetricsF QApplication QCoreApplication QMenu QShortcut QStyleOptionGraphicsItem QGraphicsLayout

syn match cType "Q\w*\w\@!"
syn match cType "Qt::\w*\w\@!"

" Highlight Class and Function names
syn match    cCustomParen    "(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def link cCustomFunc  Function
hi def link cCustomClass Function
