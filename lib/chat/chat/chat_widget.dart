import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/updatechat_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_model.dart';
export 'chat_model.dart';

/// Create a modern chat page with: top bar (avatar + name + online),
/// scrollable messages (left/right bubbles), timestamps, typing indicator,
/// and bottom input bar with text field + emoji + attach + send.
///
/// Clean, minimal WhatsApp-style design.
class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    required this.gameref,
  });

  final DocumentReference? gameref;

  static String routeName = 'chat';
  static String routePath = '/chat';

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 20.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Color(0xFF0B191E),
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(GameWidget.routeName);
              },
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1741392076269-471898558663?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjQ5NDUwNDJ8&ixlib=rb-4.1.0&q=80&w=1080',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF336A4A),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sarah Johnson',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                  ),
                  Text(
                    'Online',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          font: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                          color: Color(0xFF336A4A),
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodySmall.fontStyle,
                        ),
                  ),
                ],
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(14.0),
                child: StreamBuilder<List<MessagesRecord>>(
                  stream: queryMessagesRecord(
                    parent: widget.gameref,
                    queryBuilder: (messagesRecord) =>
                        messagesRecord.orderBy('timestamp', descending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<MessagesRecord> listViewMessagesRecordList =
                        snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        16.0,
                        0,
                        16.0,
                      ),
                      reverse: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewMessagesRecordList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 8.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewMessagesRecord =
                            listViewMessagesRecordList[listViewIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => Text(
                                  currentUserDisplayName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Container(
                                        width: 242.22,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF4B986C),
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            listViewMessagesRecord.text,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts
                                                      .plusJakartaSans(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                  lineHeight: 1.3,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.delete_sharp,
                                      color: Colors.black,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      await listViewMessagesRecord.reference
                                          .delete();
                                    },
                                  ),
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: UpdatechatWidget(
                                                  textref:
                                                      listViewMessagesRecord
                                                          .reference,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if (listViewMessagesRecord.edited == true)
                                        Text(
                                          'edited',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      Text(
                                        dateTimeFormat("jm",
                                            listViewMessagesRecord.timestamp!),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF384E58),
                                              fontSize: 11.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      Icon(
                                        Icons.done_all_rounded,
                                        color: Color(0xFF4B986C),
                                        size: 16.0,
                                      ),
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 2.0)),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xFFC8D7E4),
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 20.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.attach_file_rounded,
                            color: Color(0xFF384E58),
                            size: 24.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: false,
                            textCapitalization: TextCapitalization.sentences,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Type a message...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF0B191E),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFC8D7E4),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF4B986C),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF1F4F8),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                              suffixIcon: Icon(
                                Icons.emoji_emotions_outlined,
                                color: Color(0xFF384E58),
                                size: 24.0,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF0B191E),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            maxLines: 4,
                            minLines: 1,
                            keyboardType: TextInputType.multiline,
                            cursorColor: Color(0xFF4B986C),
                            validator: _model.textControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              if (!isAndroid && !isiOS)
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  return TextEditingValue(
                                    selection: newValue.selection,
                                    text: newValue.text.toCapitalization(
                                        TextCapitalization.sentences),
                                  );
                                }),
                            ],
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 20.0,
                          buttonSize: 40.0,
                          fillColor: Color(0xFF4B986C),
                          icon: Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            await MessagesRecord.createDoc(widget.gameref!)
                                .set(createMessagesRecordData(
                              senderRef: currentUserReference,
                              text: _model.textController.text,
                              timestamp: getCurrentTimestamp,
                              edited: false,
                            ));
                          },
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
