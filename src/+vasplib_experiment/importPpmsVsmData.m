function PPMS_VSM_DATA = importPpmsVsmData(filename, startRow, endRow)
%IMPORTFILE ���ı��ļ��е���ֵ������Ϊ�����롣
%   PPMS_VSM_DATA = importPpmsVsmData(filename) 
%   ��ȡ�ı��ļ� FILENAME ��Ĭ��ѡ����Χ�����ݡ�
%   PPMS_VSM_DATA = importPpmsVsmData(filename, startRow) 
%   ��ȡ�ı��ļ� FILENAME �� STARTROW   �е� ���һ ���е����ݡ�
%   PPMS_VSM_DATA = importPpmsVsmData(filename, startRow, endRow) 
%   ��ȡ�ı��ļ� FILENAME �� STARTROW   �е� ENDROW ���е����ݡ�
%
% Example:
%   NaTmO2_DATA = importPpmsVsmData('20201202-NaTmO2-OP.DAT', 36, 21759);
%
%   
import vasplib_experiment.*;
%% ��ʼ��������
delimiter = ',';
if nargin<=2
    startRow = 36;
    endRow = inf;
end
formatSpec = '%*q%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%[^\n\r]';
%% ���ı��ļ���
fileID = fopen(filename,'r');
%% ���ݸ�ʽ��ȡ�����С�
% �õ��û������ɴ˴������õ��ļ��Ľṹ����������ļ����ִ����볢��ͨ�����빤���������ɴ��롣
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% �ر��ı��ļ���
fclose(fileID);

%% ���޷���������ݽ��еĺ���
% �ڵ��������δӦ���޷���������ݵĹ�����˲�����������롣Ҫ�����������޷���������ݵĴ��룬�����ļ���ѡ���޷������Ԫ����Ȼ���������ɽű���

%% �����������
PPMS_VSM_DATA  = table(dataArray{1:end-1}, 'VariableNames', {'Time_Stamp_sec','Temperature_K','Magnetic_Field_Oe','Moment_emu','M_Std_Err_emu_','Transport_Action','Averaging_Time_sec','Frequency_Hz','Peak_Amplitude_mm','Center_Position_mm','Coil_Signal_mV','Coil_Signa_mV','Range_mV','M_Quad_Signal_emu','M_Raw_emu','M_Raw_2emu','Min_Temperature_K_','Max_Temperature_K_','Min_Field_Oe_','Max_Field_Oe_','Mass_grams_','MotorLag_deg_','Pressure_Torr_','VSMStatus_code','Motor_Status_code','Measure_StaMeasureStatus_code_tus_code','Measure_Count','System_Temp__K','Temp_Status_code','FieldStatus_code','ChamberStatus_code','MotorCurrent_amps_','MotorHeatsink_Temp_C'});
end
